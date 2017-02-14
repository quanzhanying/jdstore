class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.order("created_at DESC")
  end

  def cancel
    @order = Order.find_by_token(params[:id])
    @order.cancel_order!
    OrderMailer.admin_cancel_order(@order).deliver!

    redirect_to :back, notice: "订单取消成功"
  end

  def shipping
    @order = Order.find_by_token(params[:id])
    @order.ship!
    OrderMailer.shipping_order(@order).deliver!

    redirect_to :back, notice: "已经出货"
  end
end
