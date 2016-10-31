class CartItemsController < ApplicationController

  def show
    @cart_items = Cart_item.all
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end

  def add_amount
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to carts_path
  end

  def subtract_amount
    @cart_item = CartItem.find(params[:id])
      if @cart_item.quantity < 1
        flash[:warning] = '不能再少啦，你可以删除它'
      else
        @cart_item.quantity -= 1
        @cart_item.save
      end
    redirect_to carts_path
  end

  # private
  #
  # def cart_params
  #   params.require(:cart_item)
  # end

end
