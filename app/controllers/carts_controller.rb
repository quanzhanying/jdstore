class CartsController < ApplicationController
  def clean
    current_cart.clean!
     redirect_to carts_path,  warning: "请清空购物车"
  end

  def checkout
    @order = Order.new
  end
end
