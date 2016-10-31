class CartsController < ApplicationController
  before_filter :authenticate_user!

  def destroy
    @cart = current_cart
    @cart.destroy

    redirect_to '/'
  end



end
