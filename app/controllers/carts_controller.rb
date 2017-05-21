class CartsController < ApplicationController
  def clear
    @cart = Cart.find(params[:id])
    @cart.remove_all_products
    flash[:alert] = "购物车已清除"
    redirect_to :back
  end
end
