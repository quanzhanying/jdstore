class CartsController < ApplicationController
  def index
    @cart = current_cart
  end

  def clear
    current_cart.clear_cart
    current_cart.save
    flash[:notice] = "已清空购物车"
    redirect_to :back
  end


end
