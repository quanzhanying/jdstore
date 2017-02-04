class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @prouduct = Product.find(params[:id])
  end

end
