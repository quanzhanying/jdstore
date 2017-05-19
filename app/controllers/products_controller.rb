class ProductsController < ApplicationController

  def index
    @products = Product.all
    @orange = "tasty"
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将#{@product.title}加入购物车"
    else
      flash[:warning] = "您的购物车内已有此商品"
    end
      redirect_to :back
  end

  def clean_cart_products
    @products = Products.all
    current_cart.products.destroy(@products)
    flash[:alert] = "您已清空购物车"
    redirect_to :back
  end

end
