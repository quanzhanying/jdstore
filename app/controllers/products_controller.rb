class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    flash[:notice] = "成功将#{@product.title}加入购物车"
    redirect_to :back
  end
end
