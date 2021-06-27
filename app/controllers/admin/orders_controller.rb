class Admin::OrdersController < ApplicationController
  
  before_action :authenticate_admin!
  
   def show
    @postage = 800 # 配送料
    @order = Order.find(params[:id])
    
    @total_price = 0
    @order.order_details.each do |order_detail|
      @total_price += order_detail.amount * order_detail.product.tax_included_price.to_i
    end
   end

   def update
     @order = Order.find(params[:id])
     @order_details = @order.order_details
    if @order.update(order_params)
        @order.change_order_details_status
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
