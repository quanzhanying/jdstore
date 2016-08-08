class CartsController < ApplicationController
  def destroy
    current_cart.cart_items.destroy_all
    current_cart.destroy
    redirect_to :back
  end

  def up
    @cart_item=CartItem.find(params[:id])
    @cart_item.quantity=@cart_item.quantity+1
    @cart_item.save
    redirect_to :back
  end

  def down
    @cart_item=CartItem.find(params[:id])
    @cart_item.quantity=@cart_item.quantity-1
    @cart_item.save
    redirect_to :back
  end

end
