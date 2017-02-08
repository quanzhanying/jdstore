class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    redirect_to :back
    flash[:notice] = "测试加入购物车"
  end
end
