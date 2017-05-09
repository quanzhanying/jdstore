class CartsController < ApplicationController
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    flash[:alert] = "购物车已清空"
    redirect_to carts_path

  end
end
