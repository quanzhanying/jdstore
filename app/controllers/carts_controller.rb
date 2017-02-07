class CartsController < ApplicationController

  # def index
    # @carts = Cart.all
  # end

  def clean
    current_cart.clean!
    flash[:warning] = "已清空购物车"
    redirect_to carts_path
  end

  def checkout
    @order = Order.new
  end
end
