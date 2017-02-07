class CartsController < ApplicationController
  def clean
    current_cart.cart_items.destroy_all
    redirect_to carts_path, warning:"清空购物车成功"
  end
end
