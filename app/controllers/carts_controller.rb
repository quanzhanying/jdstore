class CartsController < ApplicationController
  def clear
    current_cart.cart_items.destroy
    current_cart.destroy
    redirect_to carts_path
  end
end
