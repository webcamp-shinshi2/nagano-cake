class Admin::OrdersController < ApplicationController
  
  before_action :authenticate_admin!
  
   def show
    @postage = 800 # 配送料
    @order = Order.find(params[:id])
    # @order_product = OrderDetail.where(id: @order.id)
   end

   def update
     @order = Order.find(params[:id])
     @order_details = @order.order_details
    if @order.update(order_params)
       flash[:notice] = "登録情報を変更しました!"
       redirect_to admin_order_path(@order)
    else
       render 'show'
    end
   end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
