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

  def change_quantity
    @cart_item = CartItem.find(params[:id])
    addOrRM = params[:addOrRM]
    if addOrRM=="+"
      @cart_item.quantity = @cart_item.quantity+1
    else
      @cart_item.quantity = @cart_item.quantity-1
    end
    @cart_item.save

    redirect_to :back
  end

end
