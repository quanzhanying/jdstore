class CartsController < ApplicationController

  def delete_all
    # @cart = Cart.find(session[:cart_id])
    #   @cart.destroy
    current_cart.destroy
    redirect_to carts_path
  end
end
