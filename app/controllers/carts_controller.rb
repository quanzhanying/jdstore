class CartsController < ApplicationController

  def clean
    current_cart.clean!
    flash[:alert] = "你已成功清空购物车"
    redirect_to :back
  end
end
