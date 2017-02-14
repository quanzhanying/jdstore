class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
#    redirect_to :back
#    flash[:notice] = "测试加入购物车"
    if !current_cart.products.include?(@product)
     current_cart.add_product_to_cart(@product)
#     flash[:notice] = "成功加入购物车"
      flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
    else
      flash[:notice] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end
end
