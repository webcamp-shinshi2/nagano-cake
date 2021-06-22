class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @products = Product.page(params[:page]).per(10)
  end

  def new
    @product = Product.new
    @genres = Genre.all
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
       flash[:notice] = "登録情報を登録しました!"
       redirect_to admin_product_path(@product.id)
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all  
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "登録情報を変更しました!"
      redirect_to admin_product_path(@product.id)
    else
      render 'edit'
    end
  end
  
  private
  def product_params
    params.require(:product).permit(:image, :name, :introduction, :price, :is_sale, :genre_id )
  end
  
end
