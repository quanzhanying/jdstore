class CartsController < ApplicationController

  def index
  end

  def clean
    current_cart.clean!
    flash[:alert]="已经清空购物车。"
    redirect_to :back
  end

end
