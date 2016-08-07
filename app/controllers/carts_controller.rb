class CartsController < ApplicationController

  def index
    @cart_items = current_cart.cart_items
  end

end
