class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @orders = Order.all
  end

  def cancel
    @order = Order.find(params[:id])
    OrderMailer.notify_order_cancelled_by_admin(@order).deliver!
    @order = @order.order_cancelled?
    redirect_to :back
  end

  def ship
    @order = Order.find(params[:id])
    OrderMailer.notify_order_shipped(@order).deliver!
    @order = @order.ship!
    redirect_to :back
  end

end
