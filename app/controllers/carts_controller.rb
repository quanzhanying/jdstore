class CartsController < ApplicationController

  def destroy


  end

  def delete_cart_item
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:alert] = "Delete Succeeded"
    redirect_to :back

  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to :back

  end

end
