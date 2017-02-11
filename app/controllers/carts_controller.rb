class CartsController < ApplicationController
  def clean
    # current_cart.cart_items.destroy_all,放到model内去执行
    current_cart.clean!
    flash[:warning] = "已经清空购物车"
    redirect_to carts_path
  end

  def die
    current_cart.cart_item.delete
    redirect_to carts_path
  end
end
