class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_car
    @product = Product.find(params[:id])
    redirect_to :back, notice: "测试加入购物车"
  end
end
