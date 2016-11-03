class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @orders = Order.all
  end


  def cancell
    @order = Order.find(params[:id])
    @order.is_cancell = false
    @order.save
    redirect_to :back
  end

  def cancelled
    @order = Order.find(params[:id])
    @order.is_cancell = true
    @order.save
    redirect_to :back
    #OrderMailer.notify_order_placed(Order.last).deliver!
  end

  def shipping
    @order = Order.find(params[:id])
    @order.is_ship = false
    @order.save
    redirect_to :back
  end

  def shipped
    @order = Order.find(params[:id])
    @order.is_ship = true
    @order.save
    redirect_to :back
    #OrderMailer.notify_order_placed(Order.last).deliver!
  end
end
