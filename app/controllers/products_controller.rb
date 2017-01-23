class ProductsController < ApplicationController
  def index
    @products = Product.all

    def show
      @product = Product.find(params[:id])
    end
    
end
