class CartItemsController < ApplicationController
  def destroy
    @cart_item = current_cart.cart_items.find(params[:id])
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
