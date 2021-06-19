class Customers::CartItemsController < ApplicationController

  helper_method :current_cart

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total_price = 0
    @cart_items.each do |cart_item|
    @total_price += (cart_item.product.price * 1.1) * cart_item.amount
    end
  end

  def create
    cart_item = current_customer.cart_items.new(cart_item_params)
    cart_item.save



     # cart_item.product = params[:cart_item][:product_id]
    # cart_item.product = Cartitem.find_by(product_id: cart_item.product_id, customer_id: current_customer.id)
    # cart_item.product = CartItem.find_by(product_id: product_id, id: cart_item.id)
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
