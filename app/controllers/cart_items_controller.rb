class CartItemsController < ApplicationController
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:notice] = "已经移除"
    redirect_to :back
  end

  def clear
    @cart_items = current_cart.cart_items
    #@cart_items = @cart.cart_items
    @cart_items.destroy_all
    flash[:notice] = "清空购物车"
    redirect_to carts_path
  end

  def add_item
    @cart_item = CartItem.find_by(params[:id])
    @cart_item.quantity = @cart_item.quantity + 1
    @cart_item.save
    redirect_to  :back
  end

  def des_item
    @cart_item = CartItem.find_by(params[:id])
    @cart_item.quantity = @cart_item.quantity - 1
    @cart_item.save
    redirect_to  :back
   end

end
