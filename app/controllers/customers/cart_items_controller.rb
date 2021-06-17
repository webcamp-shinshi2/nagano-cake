class Customers::CartItemsController < ApplicationController
  
  helper_method :current_cart
  
  def index
    @carts = Cart.all
  end
  
  def create
    
  end
  
  def update
  end
  
  def destroy
  end
  
  def all_destory
  end
end
