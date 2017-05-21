class CartsController < ApplicationController
  def clean
    current_cart.clean
    flash[:alert] = "购物车已清除"
    redirect_to carts_path
  end
end
