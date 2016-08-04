class ProductsController < ApplicationController
  def index
    @products = Product.where(is_on_shelf:true)
  end

  def show
    @product = Product.find(params[:id])
  end
end
