class Customers::CartItemsController < ApplicationController

  helper_method :current_cart

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    cart_item = current_customer.cart_items.new(cart_item_params)
    cart_item.save
    
    
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
  end

  def all_destory
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:amount, :product_id, :customer_id)
    end
end
