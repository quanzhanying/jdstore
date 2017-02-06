class CartsController < ApplicationController
  def clean
    current_cart.clean!
    flash[:waring] = "Already clear the cart!"
    redirect_to carts_path
  end
end
