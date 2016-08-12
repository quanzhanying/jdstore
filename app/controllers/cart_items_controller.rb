class CartItemsController < ApplicationController

  def increment
    @cart_item = current_cart.cart_items.find(params[:id])
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to :back
  end

  def decrement
    @cart_item = current_cart.cart_items.find(params[:id])
    @cart_item.quantity -= 1
    @cart_item.save
    redirect_to :back
  end

  def destroy
   @cart_item = CartItem.find(params[:id])
   @cart_item.destroy
   redirect_to :back
 end

end
