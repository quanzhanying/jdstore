class ProductsController < ApplicationController

  # 首页 R
  def index
    @products = Product.all
  end

  # 查看 R
  def show
    @product = Product.find(params[:id])
  end
  
end
