class CartsController < ApplicationController
  def destroy
    @cart = current_cart
    @cart.destroy
    redirect_to carts_path

   end
end
