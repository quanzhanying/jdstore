class CartItemsController < ApplicationController
  def create
    @cart_item=CartItem.new(params[:id])
    @cart_item.save



    
  end

  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end
end
