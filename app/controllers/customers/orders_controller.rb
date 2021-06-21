class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.where(customer_id: current_customer.id)

  end
  
  def index
  end

  def show
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

  
  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :total_price, :postage)
  end
end
