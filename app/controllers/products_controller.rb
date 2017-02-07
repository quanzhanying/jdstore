class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @products = Product.all
    @product = @products.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if current_cart.products.include?(@product)
      flash[:alert] = "该商品已经在购物车内"
      redirect_to :back
    else
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "成功加入购物车"
      redirect_to :back
    end
  end
end
