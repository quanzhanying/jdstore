class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])

    current_cart.add_product_to_cart(@product)
    flash[:notice] = "加入购物车成功"
    redirect_to :back
  end
end
