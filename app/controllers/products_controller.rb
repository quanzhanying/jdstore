class ProductsController < ApplicationController
  def index
    @producets = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
end
