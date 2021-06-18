class Customers::ProductsController < ApplicationController
  def index
  end

  def show
     # 商品情報の取得
    @product = Product.find(params[:id])
    # form_withのための空のインスタンス
    @cart_items = CartItem.new
  end
end
