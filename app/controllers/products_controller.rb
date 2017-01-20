class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @products = Product.all
    @product = @products.find(params[:id])
  end
end
