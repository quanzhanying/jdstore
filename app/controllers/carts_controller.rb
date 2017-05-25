class CartsController < ApplicationController
  def clean
    cureent_cart.clean!
    flash[:warning] = "已清空购物车"
    redirect_to carts_path
  end
end
