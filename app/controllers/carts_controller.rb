class CartsController < ApplicationController

  def up_product
      @cart_item = CartItem.find(params[:id])
      @cart_item.quantity = @cart_item.quantity + 1
      @cart_item.save
      redirect_to :back
  end

  def down_product
      @cart_item = CartItem.find(params[:id])
      @cart_item.quantity = @cart_item.quantity - 1
      @cart_item.save
      redirect_to :back
  end


  def destroy
      @cart = Cart.find(params[:id])
      @cart.cart_items.destroy_all
      redirect_to :back
  end

end
