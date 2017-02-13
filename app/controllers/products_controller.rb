class ProductsController < ApplicationController

  def index
   @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    redirect_to :back
    flash[:notice] = "该商品已经加入购物车"
  end

end
