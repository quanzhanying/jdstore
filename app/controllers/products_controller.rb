class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Prodct.find(params[:id])
    redirect_to :back
    flash[:notice] = "Test to add to cart"
  end
  
end
