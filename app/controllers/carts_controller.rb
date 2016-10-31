class CartsController < ApplicationController


  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] =nil
    redirect_to :back, notice: "The cart is empty now."
  end

end
