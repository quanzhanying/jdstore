class CartItemsController < ApplicationController
  def destroy
   @cart_item = CartItem.find(params[:id])
   @cart_item.destroy
   redirect_to :back
 end
end
