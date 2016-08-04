class ProductsController < ApplicationController
  def index
    @products = Product.all.is_publish
  end

  def show
    @product = Product.find(params[:id])
  end
end
