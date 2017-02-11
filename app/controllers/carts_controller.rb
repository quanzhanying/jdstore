class CartsController < ApplicationController
  def index

  end

  def checkout
    @order = Order.new
  end

  def clean
    current_cart.clean!
    flash[:warning] = "Successfully clean carts..."
    redirect_to carts_path
  end


end
