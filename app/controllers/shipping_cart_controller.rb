class ShippingCartController < ApplicationController

  def destroy
    @cart_item = current_cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to :back
  end

  def destroy_all_items
    @cart = Cart.find(params[:id])
    @cart.cart_items.destroy_all
    redirect_to :back
  end
end
