class Customers::OrdersController < ApplicationController
  def new
    if cart_items = CartItem.where(customer_id: current_customer.id).present?
      @order = Order.new
      @customer = current_customer
      @addresses = Address.where(customer_id: current_customer.id)
    else
      redirect_to cart_items_path, alert: "カートに商品が入っておりません"
    end
  end

  

  def confirm
    
    
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
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :total_price, :postage)
  end
end
