class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
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
    OrderMailer.notify_order_placed(Order.last).deliver!
  end

end
