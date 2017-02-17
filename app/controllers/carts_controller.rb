class CartsController < ApplicationController

  def index
  end

  def destroy
    @cart_item = current_cart.cart_items.find(params[:id])

    @cart_item.destroy
    flash[:notice] = "已从购物车中删除！"
    redirect_to :back
  end

end
