class CartsController < ApplicationController

  def clear
    current_cart.clear!
    redirect_to :back, notice: '购物车已清空'
  end

end
