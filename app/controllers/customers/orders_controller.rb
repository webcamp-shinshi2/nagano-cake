class Customers::OrdersController < ApplicationController

  def index
    @orders = current_customer.orders.order(created_at: :desc).page(params[:page]).per(8)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def new
    if cart_items = CartItem.where(customer_id: current_customer.id).present?
      @order = Order.new
      @customer = current_customer
      @addresses = current_customer.addresses
    else
      redirect_to cart_items_path, notice: "カートに商品が入っておりません"
    end
  end


  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items

    @order.postage = 800
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.amount * cart_item.product.tax_included_price.to_i
    end

    @order.total_price =  @order.postage + @total_price

    @order.payment_method = params[:order][:payment_method]
    @order.customer_id = current_customer.id
    # @address_exist = 0はアドレスの定義で普通の状態が0
    @address_exist = 0
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      # 郵便番号７桁以外かつ空だったらまたはアドレスが空だったらまたは名前が空だったら情報入力画面で止める
      if @order.postal_code.empty? || @order.postal_code.length != 7 || @order.address.empty? || @order.name.empty?
        @customer = current_customer
        @addresses = current_customer.addresses
        flash.now[:notice] = "正しい情報を入力してください"
        return render "new"
      end
      @address_exist = 1
      # params[:order][:address_option] == "2"を通ると @address_existの値が1になる
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      @cart_items = current_customer.cart_items.all
        @cart_items.each do |cart_item|
          @order_detail = @order.order_details.new
          @order_detail.product_id = cart_item.product.id
          @order_detail.price = cart_item.product.price * cart_item.amount
          @order_detail.amount = cart_item.amount
          @order_detail.save
        end
        if params[:order][:address_exist] == "1"
            # @address_exist = 1はpostメソッドで送られて文字列に変換されている
            # @address_exist = 1だった場合カスタマーの新規住所を登録
          @address = current_customer.addresses.build
          @address.postal_code = params[:order][:postal_code]
          @address.address = params[:order][:address]
          @address.name = params[:order][:name]
          if @address.save
            flash[:notice] = "新しい住所が登録されました"
          end
        end
        current_customer.cart_items.destroy_all
        redirect_to orders_thanx_path
    end

  end

  def thanx
  end


  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :total_price, :postage, :status)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end
end
