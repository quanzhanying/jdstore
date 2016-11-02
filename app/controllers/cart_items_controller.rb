class CartItemsController < ApplicationController

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to :back
  end

  def up_cart_item
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity  < @cart_item.product.quantity
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to :back
  else
    flash[:warning] = "都让你要了！！"
    redirect_to :back
  end
  end

  def down_cart_item
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity -= 1
    if @cart_item.quantity < 1
    else
    @cart_item.save
  end
    redirect_to :back
  end

end
