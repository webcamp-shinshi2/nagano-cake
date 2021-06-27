class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    case params[:index]
    when "0"
      @customer = Customer.find(params[:customer_id])
      @orders = @customer.orders.all.order(created_at: :desc).page(params[:page]).per(10)
    else
      @orders = Order.all.order(created_at: :desc).page(params[:page]).per(10)
    end
  end
end
