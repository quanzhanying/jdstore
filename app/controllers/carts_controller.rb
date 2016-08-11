class CartsController < ApplicationController
  def destroy
    # @cart = Cart.find(params[:id])
    @cart = current_cart
    @cart.cart_items.each do |cart_item|
     cart_item.destroy
    end
    @cart.destroy
    redirect_to carts_path
  end

  def delete_one_item
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end

  def checkout
    @order = Order.new
  end

end
