class CartsController < ApplicationController
  def clean
    current_cart.clean!
    flash[:warning] = "Have cleaned the Cart!"
    redirect_to carts_path
  end

  def checkcout
    @order = Order.new
  end
end
