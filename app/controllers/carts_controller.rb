class CartsController < ApplicationController
  def clean
   current_cart.clean!
   flash[:warning] = "Successfully cleaned..."
   redirect_to carts_path
  end
end
