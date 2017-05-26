class CartsController < ApplicationController
  def clean
    current_cart.clean!
    flash[:warning] = "Have cleaned the Cart!"
    redirect_to carts_path
  end

  def checkout
    @order = Order.new
  end
end
