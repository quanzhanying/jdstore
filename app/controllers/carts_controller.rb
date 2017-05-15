class CartsController < ApplicationController

def cleanup
  current_cart.clean!
  flash[:warning] = "购物车已经清空"
  redirect_to carts_path
end

def checkout
  @order = Order.new
end

end
