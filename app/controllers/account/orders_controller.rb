class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.order("id DESC")
  end

  def cancel
    @order = Order.find_by(token: params[:id])
    if @order.cancel_order!
      flash[:alert] = "订单取消成功"
    else
      flash[:warning] = "订单取消失败"
    end

    OrderMailer.notify_order_cancelled(@order).deliver!

    redirect_to account_orders_path
  end

  def return
    @order = Order.find_by(token: params[:id])
    if @order.return_good!
      flash[:alert] = "进入退单流程"
    else
      flash[:warning] = "退单失败"
    end
    redirect_to account_orders_path
  end

end
