class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total =current_cart.total_price

    if @order.save
      redirect_to order_path(order) #怎么快速识别哪个path对应的路径?
    else
      render 'carts/checkout'
    end
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end


end
