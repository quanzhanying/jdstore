class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def index
    @product = Product.find(params[:id])
  end
end
