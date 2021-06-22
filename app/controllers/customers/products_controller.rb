class Customers::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(8)
    @product_count = Product.count
  end



  def show
    @product = Product.find(params[:id])
    # form_withのための空のインスタンス
    @cart_item = CartItem.new
  end

  def product_params
    params.require(:product) .permit(:name, :price, :image_id, :is_sale)

  end
end
