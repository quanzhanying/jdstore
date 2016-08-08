class CartsController < ApplicationController


  def delall
    current_cart.destroy
    redirect_to carts_path
  end

  def minusitem
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end
end
