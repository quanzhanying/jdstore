class CartsController < ApplicationController

  def clear_cart
    current_cart.clean!
    redirect_to :back
  end

end
