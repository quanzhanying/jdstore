class CartsController < ApplicationController

  def clean
    current_cart.clean!
    flash[:warning] = "已清空购物车"
    redirect_to carts_path

    def checkout
      @order = Order.new
    end
  end


end
