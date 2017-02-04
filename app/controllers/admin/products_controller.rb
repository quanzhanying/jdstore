class Admin::ProductsController < ApplicationController
# in here to fill before conditions

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

end
