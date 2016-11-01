class CartItemsController < ApplicationController
  def destroy
    @cart_item = current_cart.cart_items.find(params[:id])
    @cart_item.destroy

    flash[:alert] = "Cart_item Deleted"
    redirect_to carts_path
  end
end
