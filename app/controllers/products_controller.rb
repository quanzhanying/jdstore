class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    redirect_to product_path
    # redirect_to :back 也可以用。
    current_cart.add_product_to_cart(@product)
    flash[:notice] =  "测试加入购物车"
  end
end
