class CartItemsController < ApplicationController

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to :back
  end

  def up_cart_item
    @cart_item = CartItem.find(params[:id])
    @cart_item.product.create
    redirect_to :back
  end

  def down_cart_item
    @cart_item = CartItem.find(params[:id])
    @cart_item.product.destroy
    redirect_to :back
  end

end
