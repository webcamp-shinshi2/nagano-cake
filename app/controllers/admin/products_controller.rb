class Admin::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(8)
  end

  def new
  end

  def show
  end

  def edit
  end
end
