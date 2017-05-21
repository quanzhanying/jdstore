class CartsController < ApplicationController

  def clean
    current_cart.clean!
    flash[:warning]= "Cart has been emptied"
    redirect_to carts_path
  end

  def checkout
    @order = Order.new
  end

end
