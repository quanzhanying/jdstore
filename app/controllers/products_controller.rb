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
    flash[:notice] = "成功加入购物车"
    redirect_to :back
  end

  def clean_cart_products
    @products = Products.all
    current_cart.products.destroy(@products)
    flash[:alert] = "您已清空购物车"
    redirect_to :back
  end

end
