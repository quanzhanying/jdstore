class CartItemsController < ApplicationController

  def show
    @cart_items = Cart_item.all
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end



  # def add_amount
  #   @cart_item = Cart_item.find(params[:id])
  #   @cart_item = @cart_item.count+1
  #   redirect_to :back
  # end
  #
  # def subtract_amount
  #   @cart_item = Cart_item.find(params[:id])
  #   @cart_item = @cart_item.count-1
  #   redirect_to :back
  # end

  # private
  #
  # def cart_params
  #   params.require(:cart_item)
  # end

end
