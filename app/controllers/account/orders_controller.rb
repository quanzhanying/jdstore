class Account::OrdersController < ApplicationController
  before_action :authenticate_user! 

  def index
    @orders = Order.where(user_id: current_user)
  end

  def apply_cancell_order
    # puts params[:id]
    @order = Order.find_by_token(params[:order_id])
    puts @order.user_id
    # 发请求取消订单邮件
    ApplyCancellOrderMailer.notify_cancell_order(@order).deliver

  end
end
