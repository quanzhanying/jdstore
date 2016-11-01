class CartItemsController < ApplicationController
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to :back
  end

  def item_increase
    @cart_item = CartItem.find(params[:id])
    @cart_item.increase
    redirect_to :back
  end

  def item_decrease
    @cart_item = CartItem.find(params[:id])
    @cart_item.decrease
    redirect_to :back
  end


end
