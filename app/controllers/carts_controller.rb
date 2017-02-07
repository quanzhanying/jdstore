class CartsController < ApplicationController
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path, alert: '购物车已经清空'
  end
end
