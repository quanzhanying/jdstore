class CartsController < ApplicationController
  def destroy
    # @cart = Cart.find(params[:id])
    @cart = current_cart
    @cart.cart_items.each do |cart_item|
     cart_item.destroy
    end

    # @cart.destroy
    # redirect_to carts_path
    redirect_to root_path
  end

end
