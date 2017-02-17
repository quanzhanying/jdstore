class CartsController < ApplicationController

  def index
  end

  def destroy
    @cart_item = current_cart.cart_items.find(params[:id])

    @cart_item.destroy
    flash[:notice] = "已从购物车中删除！"
    redirect_to :back
  end

  def empty
    @cart_items = current_cart.cart_items

    @cart_items.destroy_all
    flash[:notice] = "已经清空购物车！"
    redirect_to :back
  end

end
