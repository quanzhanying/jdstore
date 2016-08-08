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
      quantity = @cart_item.product.quantity
      if quantity > @cart_item.quantity+1
        @cart_item.quantity = @cart_item.quantity+1
        @cart_item.save
      else
        flash[:alert] = "商品已经抢光了哦"
      end
    else
      if @cart_item.quantity>1
        @cart_item.quantity = @cart_item.quantity-1
        @cart_item.save
      end
    end

    redirect_to :back
  end

end
