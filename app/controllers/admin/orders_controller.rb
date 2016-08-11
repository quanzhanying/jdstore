class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!
    OrderMailer.notify_order_shipping(@order).deliver!
    redirect_to :back
  end

  def cancelled
    @order = Order.find(params[:id])
    @order.cancell_order!
    OrderMailer.notify_order_cancelled(@order).deliver!
    redirect_to :back
  end

end
