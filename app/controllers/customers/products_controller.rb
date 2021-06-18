class Customers::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(8)
    @genres = Genre.all

  end

  def show

     # 商品情報の取得
    @product = Product.find(params[:id])
    # form_withのための空のインスタンス
    @cart_items = CartItem.new

   
    
  
  end
  
  def product_params
    params.require(:product) .permit(:name, :price, :image_id, :is_sale)

  end
end
