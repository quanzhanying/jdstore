class ProductsController < ApplicationController
  def index
    @productd = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

end
