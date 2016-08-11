class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def cancel
    @order = Order.find(params[:id])
    OrderMailer.notify_order_cancelled_by_admin(@order).deliver!
    @order = @order.cancell_order!
    redirect_to :back
  end

  def ship
    @order = Order.find(params[:id])
    OrderMailer.notify_order_shipped(@order).deliver!
    @order = @order.ship!
    redirect_to :back
  end

end
