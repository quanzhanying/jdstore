class Account::OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def apply_for_cancell
    @order = Order.find_by_token(params[:id])
    @order.is_applied_cancell = true
    @order.save
    OrderMailer.notify_order_placed(@order).deliver!
    flash[:alert] = "朝阳不可战胜！！！！！"
    redirect_to account_orders_path
  end
end
