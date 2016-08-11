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
    #flash[:alert] = params[:quantity]
    #可以用来debug
    @cart_item = current_cart.cart_items.find(params[:id])
    #@cart_item = CartItem.find(params[:id])
    #@cart_item = CartItem.find_by(id:params[:id])
    #通过params[:id]从数据库中找到数据传给@cart_item
    if @cart_item.quantity < @cart_item.product.quantity
      @cart_item.quantity = @cart_item.quantity + 1
      @cart_item.save
      redirect_to  :back
    else
      redirect_to :back
      flash[:alert] = "已经没有库存"
    end
  end

  def des_item
    @cart_item = current_cart.cart_items.find(params[:id])
    #@cart_item = CartItem.find(params[:id])
    @cart_item.quantity = @cart_item.quantity - 1
    @cart_item.save
    redirect_to  :back
   end

end
