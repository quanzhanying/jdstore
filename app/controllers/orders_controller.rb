class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price
    # total_price函数，写在了model层，果真，各类controller都可以调用它了。
    if @order.save
      redirect_to order_path(@order)
    else
      render 'carts/checkout'
      # ?是否是回到checkout.html.erb
    end
  end


  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
