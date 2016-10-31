class CartItemsController < ApplicationController


  # 闪出指定的item
  def destroy
    # @cart = Cart.find(params[:cart_id])
    @cartItem = CartItem.find(params[:id])
    @cartItem.destroy
    # @product.destroy
    redirect_to carts_path
  end
end
