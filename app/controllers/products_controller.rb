class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    flash[:alert] = '抱歉，商品数量小于1' if @product.quantity.zero?

    if current_cart.products.include?(@product)

      flash[:alert] = '已加入购物车了'
    else
      current_cart.add_product_to_cart(@product)

      flash[:notice] = '成功加入购物车'
    end

    redirect_to :back
  end
end
