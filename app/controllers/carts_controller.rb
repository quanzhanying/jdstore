class CartsController < ApplicationController
  def clean
    current_cart.clean!
    flash[:warning]="Emptied cart successfully"
    redirect_to carts_path
  end
end
