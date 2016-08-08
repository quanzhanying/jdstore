class CartsController < ApplicationController


  def move_product_from_cart
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

    redirect_to :back
  end

end
