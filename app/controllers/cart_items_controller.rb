class CartItemsController < ApplicationController


  def destroy

    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to :back
  end
end
