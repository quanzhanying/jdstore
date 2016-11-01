class CartsController < ApplicationController

  # 清空购物车
  def clear_cart
    # 循环删除
    current_cart.cart_items.each do |item|
      item.destroy
    end
    flash[:notice] = "购物车已清空"
    # 重定向回来
    redirect_to :back
  end



end
