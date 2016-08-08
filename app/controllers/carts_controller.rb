class CartsController < ApplicationController

  def destroy
      @cart = Cart.find(params[:id])

      @cart.destroy
      redirect_to :back
    end

  def delete_cart_item
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to :back
  end

end
