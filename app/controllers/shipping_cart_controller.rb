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

  def current_cart_add_item
    @cart_item_quantity = current_cart.cart_items.find(params[:id])
    @cart_item_quantity.quantity = @cart_item_quantity.quantity + 1
    @cart_item_quantity.save
    redirect_to :back
  end

  def current_cart_delete_item
    @cart_item_quantity = current_cart.cart_items.find(params[:id])
    @cart_item_quantity.quantity = @cart_item_quantity.quantity - 1
    @cart_item_quantity.save
    redirect_to :back
  end

  def checkout
    @order = Order.new
  end
end
