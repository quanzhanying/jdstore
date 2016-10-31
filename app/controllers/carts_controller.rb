class CartsController < ApplicationController
  def destroy
    @cart = current_cart
    @cart.destroy

    flash[:alert] = "Cart Deleted"
    redirect_to carts_path
  end
end
