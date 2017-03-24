class CartsController < ApplicationController

before_action :authenticate_user!
#限制查看购物车之前，必须先登录

def clean
  current_cart.clean!
  flash[:warning]="已清空购物车"
  redirect_to carts_path
end

def checkout
  @order= Order.new
end

end
