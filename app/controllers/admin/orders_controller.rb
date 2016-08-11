class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.order('created_at DESC')
  end

  def order_cancelled
    @order = Order.find(params[:id])
    @order.cancel_order!
    redirect_to :back, notice: '订单已取消'
    OrderMailer.notify_order_cancelled(@order).deliver!
  end

  def good_returned
    @order = Order.find(params[:id])
    @order.return_good!
  end

  def shipping
    @order = Order.find(params[:id])
    @order.ship!
    redirect_to :back, notice: '已发货'
    OrderMailer.notify_shipping(@order).deliver!
end
end
