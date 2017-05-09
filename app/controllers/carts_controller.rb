class CartsController < ApplicationController
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    flash[:alert] = "购物车已清空"
    redirect_to carts_path
  end

  def delete_cart_item
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

    flash[:alert] = "商品已删除"
    redirect_to carts_path
  end
end
