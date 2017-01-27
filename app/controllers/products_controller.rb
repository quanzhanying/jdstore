class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @prduct = Prduct.find(params[:id])
  end
end
