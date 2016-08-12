class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def cancel
    @order = Order.find(params[:id])
    OrderMailer.notify_order_cancelled(@order).deliver!
    @order = @order.cancell_order!
    redirect_to :back
  end

  def deliver
    @order = Order.find(params[:id])
    @order = @order.deliver!
    redirect_to :back
  end

  def return_good
    @order = Order.find(params[:id])
    @order = @order.return_good!
    redirect_to :back
  end
end
