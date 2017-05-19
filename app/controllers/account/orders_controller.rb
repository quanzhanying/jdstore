class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = current_user.orders.order("id DESC")
  end

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("alipay")
    @order.pay!
    redirect_to order_path(@order.token), notice: "使用支付宝付款成功"
  end
  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("wechat")
    @order.pay!
    redirect_to order_path(@order.token), notice: "使用微信付款成功"
  end
end
