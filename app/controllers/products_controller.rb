class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def show
   @prodcut = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    redirect_to :back
  end
  
end
