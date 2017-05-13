class ProductsController < ApplicationController
  def index
    @products = Products.all
  end

  def show
    @product = Product.find(params[:id])
  end
end
