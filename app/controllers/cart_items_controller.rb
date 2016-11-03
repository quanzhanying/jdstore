class CartItemsController < ApplicationController

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end

  def add_quantity
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity < @cart_item.product.quantity
      @cart_item.quantity += 1
      @cart_item.save
    else
      flash[:alert] = '已超出库存'
    end

    redirect_to :back
  end

  def reduce_quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.reduce_button

    redirect_to :back
  end

end
