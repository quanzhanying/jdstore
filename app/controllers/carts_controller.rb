class CartsController < ApplicationController

  def destroy
    @cart = current_cart
    @cart.destroy
    redirect_to :back, notice: "delete all"
end
end
