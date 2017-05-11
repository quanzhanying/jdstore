class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = find.(params[:id])
  end


end
