class CartItemsController < ApplicationController

  def item_increase
    @cartItem = CartItem.find(params[:id])
    @cartItem.num_increase
    puts @cartItem.quantity

    redirect_to carts_path
  end

  def item_decrease
    @cartItem = CartItem.find(params[:id])
    @cartItem.num_decrease
    redirect_to carts_path    
  end

  # 闪出指定的item
  def destroy
    # @cart = Cart.find(params[:cart_id])
    @cartItem = CartItem.find(params[:id])
    @cartItem.destroy
    # @product.destroy
    redirect_to carts_path
  end
end
