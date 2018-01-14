class ProductsController < ApplicationController
  def index
    @products = Product.where(:is_hidden => false)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    redirect_to :back
    flash[:notice] = "test mv to cart"
  end

end
