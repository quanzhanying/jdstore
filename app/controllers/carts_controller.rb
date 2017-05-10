class CartsController < ApplicationController
  def index
    @cart = current_cart
  end

  def clear
    current_cart.clear_cart
    current_cart.save
    flash[:notice] = "已清空购物车"
    redirect_to :back
  end

  def remove_product
    @product = Product.find(params[:id])
    if !@product.blank?
      flash[:notice] = "商品已从购物车拿掉"
      current_cart.remove_product(@product)
      redirect_to :back
    else
      flash[:warning] = "商品已下架"
    end
  end

end
