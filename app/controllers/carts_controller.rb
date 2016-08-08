class CartsController < ApplicationController

  def delete_cart_item
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to :back
  end
  
end
