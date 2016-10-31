class CartsController < ApplicationController
  before_filter :authenticate_user!

  def delete
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to carts_path
  end
end
