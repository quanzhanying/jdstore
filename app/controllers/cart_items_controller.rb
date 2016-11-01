class CartItemsController < ApplicationController
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

    redirect_to carts_path
  end

  def add_quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to carts_path
  end

  def minus_quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity -= 1
    @cart_item.save
    redirect_to carts_path
  end
end
