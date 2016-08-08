class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end


  def destroy
    @cart = Cart.find(session[:cart_id])
    @cart.destroy
    redirect_to root_path
  end

end
