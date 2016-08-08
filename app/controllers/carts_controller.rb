class CartsController < ApplicationController

  def destroy
    @cart = Cart.find(params[:id])

    @cart.cart_items.each do |cart_item|
      cart_item.destroy
    end
    @cart.destroy
    redirect_to carts_path
  end

  def delete_item
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:alert] = "Deleted!"
    redirect_to :back
  end

end
