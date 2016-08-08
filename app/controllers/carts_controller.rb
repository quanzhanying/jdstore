class CartsController < ApplicationController
  # 从报错信息来看，我要想创建订单的话好像要在这里写上create方法

  def destroy
    current_cart.cart_items.destroy_all
    redirect_to :back, alert: "Your cart has been cleared!"
  end

  # def clear_all
  #   cart.cart_items.destroy_all
  #   redirect_to :back, alert: "Your cart has been cleared!"
  # end

end
