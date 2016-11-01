class CartItemsController < ApplicationController

  def item_increase
    @cartItem = CartItem.find(params[:id])
    if !@cartItem.num_increase
    #   flash[:notice] = "increase"
    # else
      flash[:notice] = "不能超过库存"
    end
    redirect_to carts_path
  end

  def item_decrease
    @cartItem = CartItem.find(params[:id])
    if !@cartItem.num_decrease
    #   flash[:notice] = "decrease"
    # else
      flash[:notice] = "数量不能低于0"
    end
    # @cartItem.num_decrease
    redirect_to carts_path    
  end

  # 闪出指定的item
  def destroy
    # @cart = Cart.find(params[:cart_id])
    @cartItem = CartItem.find(params[:id])
    @cartItem.destroy
    # @product.destroy
    flash[:notice] = "删除成功"
    redirect_to carts_path
  end
end
