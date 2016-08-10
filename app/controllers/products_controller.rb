class ProductsController < ApplicationController

  def index
    @products = Product.where(:is_hidden => false).order("created_at DESC")
  end

  def show
    @products = Product.where(:is_hidden => false).order("created_at ASC")
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if  current_cart.products.include?(@product)
        flash[:alert] = "您选择的商品已经在购物车中！"
        redirect_to :shipping_cart_index
    else
        @product = Product.find(params[:id])
        current_cart.add_product_to_cart(@product)
        redirect_to :shipping_cart_index
    end
  end

end
