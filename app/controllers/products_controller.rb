class ProductsController < ApplicationController
  def index
    @products = Prodct.all
  end

  def show
    @product = Product.find(params[:id])
  end
end
