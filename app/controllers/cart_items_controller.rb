class CartItemsController < ApplicationController
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to :back
  end

  def increase
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to :back
  end

  def decrease
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity -= 1
    @cart_item.save
    redirect_to :back
  end


end
