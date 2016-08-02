class ProductsController < ApplicationController
  def index
    @products = Product.published
  end

  def show
    @product = Product.find(params[:id])
  end
end
