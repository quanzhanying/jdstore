class CartsController < ApplicationController

  def destroy
    @cart_item = current_cart.cart_items.find(params[:id])
    if  @cart_item.destroy
      flash[:notice] = "Move product success！"
    else
      flash[:warning] = "Delete product failed！"
    end
    redirect_to :back
  end

  def empty_cart_items
    # @cart = Cart.find(params[:id])
    @cart = current_cart
    @cart.cart_items.destroy_all
    flash[:warning] = "Empty cart success！"
    redirect_to :back
  end

  def checkout
    @order = Order.new
  end

end
