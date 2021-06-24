class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = OrderDetail.where(id: @order.id)
    if @order_detail.update(order_detail_params)
       @order_detail.change_order_status
       flash[:notice] = "ステータスを変更しました!"
       redirect_to admin_order_path(@order)
    else
       render 'show'
    end
  end
  
  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
  
end
