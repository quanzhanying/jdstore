class CartsController < ApplicationController

  def clear_cart
    @cart = Cart.find(params[:id])

    @cart.cart_items.destroy_all
    # @cart.cart_items.each do |cart_item|
    #   cart_item.destroy
    # end

    redirect_to :back
  end

  def remove_item_from_cart

    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to :back
  end

end
