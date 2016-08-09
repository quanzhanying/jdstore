class CartItemsController < ApplicationController

  def incream_quantity
    @cart_item = CartItem.find(params[:id])
    #@cart_item1 = CartItem.find_by(cart_id: params[:id],product_id: current_cart.product)
    @cart_item.quantity = @cart_item.quantity + 1
    @cart_item.save
    redirect_to carts_path
  end

  def decream_quantity
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity > 0
      @cart_item.quantity = @cart_item.quantity - 1
      @cart_item.save
      redirect_to carts_path
    else
      redirect_to :back, alert: "The quantity can't be 0"
    end

  end
end
