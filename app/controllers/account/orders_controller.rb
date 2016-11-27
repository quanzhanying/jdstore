class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def cancell
    @order = Order.find(params[:id])
    @order.cancell_order!
    OrderMailer.notify_order_cancell(@order).deliver!
    redirect_to :back
  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
    @order.is_paid = true
    @order.make_payment!
    @order.save
    redirect_to account_orders_path
  end

  def require_cancell
      @order = Order.find(params[:id])
      @order.cancell_require!
      # OrderMailer.notify_order_cancell(@order).deliver!
      redirect_to :back
  end

  def require_return_good
    @order = Order.find(params[:id])
    # OrderMailer.notify_require_return_good(@order).deliver!
  end
end
