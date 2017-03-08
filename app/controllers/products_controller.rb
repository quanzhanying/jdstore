class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "#{@product.title}已成功加入购物车！"
    else
      flash[:warning] = '您的购物车内已有此商品，请务重复添加！'
  end
    redirect_to :back
  end
end
