class CartsController < ApplicationController

  # 清空购物车
  def clear_cart
    # 循环删除
    current_cart.cart_items.each do |item|
      item.destroy
    end
    # 重定向回来
    redirect_to :back
  end


  # 删除购物车内某一商品
  def rm_from_cart
    # puts item
    # # item_rm = current_cart.cart_items.find(item)
    # # item.destroy
    # # 重定向回来
    # redirect_to :back    
  end

  # 不能在购物车内重复添加同一商品

  # 在购物车内更改商品数量
  def cgitem_num
    
  end

  # 库存0的商品不能购买

  # 购物车内新增数量不能超过库存

end
