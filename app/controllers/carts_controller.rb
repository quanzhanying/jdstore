class CartsController < ApplicationController
  before_filter :authenticate_user!

  def destroy
    @cart = current_cart
    @cart.destroy
    # @cart_item = CartItem.where()
    # @cart_items.each do |cart_item|
    #   d.cart_item

    redirect_to :back
  end

  def add_cart_item
  end


end
