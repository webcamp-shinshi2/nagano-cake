class Customers::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(8)

  end

  def show
    @product = Product.find(params[:id])
    
  
  end
  
  def product_params
    params.require(:product) .permit(:name, :price, :image_id, :is_sale)
  end
end
