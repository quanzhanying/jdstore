class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @orders = Order.all
  end

  def cancel
    @order = Order.find(params[:id])
    @order.order_cancelled?
    OrderMailer.notify_order_cancelled(@order).deliver!
    @order.save
    flash[:notice] = "You have cancelled order."
    redirect_to :back
  end

  def ship
    @order = Order.find(params[:id])
    OrderMailer.notify_order_cancelled(@order).deliver!
    @order = @order.ship!
    redirect_to :back
  end
  
end
