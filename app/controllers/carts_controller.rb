class CartsController < ApplicationController
  def clean
    current_cart.clean!
    flash[:warning] = "Empty the shopping cart successfully!"
    redirect_to carts_path
  end

  def checkout
    @order = Order.new
  end
end
