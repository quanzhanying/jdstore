class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if @product.quantity > 0
      banding pry
      if current_cart.cart_items.quantity >= @product.quantity
        flash[:alert] = '超出库存'
      else
        current_cart.add_product_to_cart(@product)
        flash[:alert] = '已加入购物车！'
      end
    else
      flash[:alert] = '库存为零'
    end
    redirect_to :back
  end

  def destroy_to_cart
    @product = Product.find(params[:id])
    current_cart.destroy_product_to_cart(@product)
    redirect_to :back
  end
end
