class Admin::OrdersController < ApplicationController
   def show
    @postage = 800 # 配送料
    @order = Order.find(params[:id])
    @order_details = @order.order_details
   end

   def update
     @order = Order.find(params[:id])
     @order_details = @order.order_details
    if @order.update(order_params)
       flash[:notice] = "登録情報を変更しました!"
       @order.change_making_status
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
