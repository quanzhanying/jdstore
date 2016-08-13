class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @orders = Order.all.recent
  end


  def ship
    @order = Order.find(params[:id])
    @order.ship!
    OrderMailer.notify_ship(@order).deliver!
    redirect_to :back
  end

  def cancel
    @order = Order.find(params[:id])
    @order.cancel_order!
    OrderMailer.notify_cancel(@order).deliver!
    redirect_to :back
  end

end
