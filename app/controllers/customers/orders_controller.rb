class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @customer_addresses = Address.where(customer_id: current_customer.id)
    
  end
  
  def create
     @order = Order.new(order_params)
     @order.save(order_params)
     redirect_to 
  end

  def confirm
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
