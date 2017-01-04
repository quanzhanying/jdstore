class CartsController < ApplicationController
  def clear
    current_cart.destroy
    redirect_to carts_path
  end

  def checkout
    @order = Order.new
  end
end
