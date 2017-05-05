class ProductsController < ApplicationController
  def index
    @products = Product.recent.where(:is_hidden => false)
  end

  def show
    @product = Product.find(params[:id])
  end
end
