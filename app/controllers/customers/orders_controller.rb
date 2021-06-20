class Customers::OrdersController < ApplicationController
  def new
    if cart_items = CartItem.where(customer_id: current_customer.id).present?
      @order = Order.new
      @customer = current_customer
      @addresses = current_customer.addresses
    else
      redirect_to cart_items_path, alert: "カートに商品が入っておりません"
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
    if params[:order][:address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.address_name = current_customer.last_name + current_customer.first_name
      render :confirm
    elsif params[:order][:address] == "1"
      @address = Address.find(params[:order], [:address])
      @order.postal_code = addresses.postal_code
      @order.address = addresses.address
      @order.name = addresses.name
      render :confirm
    else
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      render :confirm
    end
    if @order.invalid?
      @customer = Customer.find(current_customer.id)
      @customer_adresses = Address.where(customer_id: current_customer.id)

    end

  end

  def create
    # @order = Order.new(order_params)
    # @order
    # redirect_to customers_confirm_path
  end

  def thanx
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :total_price, :postage, :status)
  end
end
