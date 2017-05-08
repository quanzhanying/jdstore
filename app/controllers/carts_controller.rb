class CartsController < ApplicationController
  def clean
     current_cart.clean!
     flash[:warning] = "Shopping cart empty"
     redirect_to carts_path
   end
end
