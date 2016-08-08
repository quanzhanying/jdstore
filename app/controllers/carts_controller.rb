class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @cart.destroy
    redirect_to carts_path
  end
end
