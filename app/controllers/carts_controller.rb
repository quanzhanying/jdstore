class CartsController < ApplicationController

  def delete_products
    current_cart.cart_items.delete_all
    redirect_to carts_path
  end

  def delete_cart_item
    @cart_item = current_cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end
end
