class CartItemController < ApplicationController
  def destroy
    @cart_item = CartItem.find(params[:id])

    @cart_item.destroy

    redirect_to root_path
  end
end
