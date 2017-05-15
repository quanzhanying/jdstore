class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price

    if @order.save
      redirect_to order_path(@order)
    else
      render 'carts/checkout'
    end

  end

  private

  def order_params
    params.require(:order).permit(:shipping_name, :shipping_address, :shipping_number, :shipping_by, :paid_by)
  end
end
