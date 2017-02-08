class CartsController < ApplicationController

  def clear_cart
    current_cart.clean!
    redirect_to :back
  end

  def checkout
    @order = Order.new
  end

end
