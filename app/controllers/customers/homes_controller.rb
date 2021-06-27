class Customers::HomesController < ApplicationController
  def top
    @products = Product.all
  end

  def about
    
  end
end
