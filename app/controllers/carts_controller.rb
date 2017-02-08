class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def destroy_all_cis
    current_cart.destroy_all_cis(@product)
    flash[:notice] = "已清空购物车"
    redirect_to carts_path
  end


end
