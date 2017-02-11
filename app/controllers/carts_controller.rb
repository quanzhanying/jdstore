class CartsController < ApplicationController
  def clean
    current_cart.clean!
    flash[:warning] = "Cart Cleaned"
    redirect_to carts_path
  end
end
