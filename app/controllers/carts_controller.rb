class CartsController < ApplicationController

  def destroy
    @cart = current_cart
    @cart.destroy
    flash[:notice] = "成功清空购物车"
    redirect_to products_path
  end

end
