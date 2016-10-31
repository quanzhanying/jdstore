class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def show
   @prodcut = Product.find(params[:id])
  end

  
end
