class CartsController < ApplicationController

  def destroy
    current_cart.destroy
    flash[:alert] = "The cart has been empted "
    redirect_to carts_path
  end

  def clean
    current_cart.clean!
    flash[:warning] = "Clear the Shopcar!"
    redirect_to carts_path
  end
end
