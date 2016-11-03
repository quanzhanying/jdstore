class Account::OrdersController < ApplicationController
  before_action :authenticate_user! 

  def index
    @orders = Order.where(user_id: current_user)
  end

  # 消费者申请取消订单
  def apply_cancell_order
    # puts params[:id]
    @order = Order.find_by_token(params[:order_id])
    # 发请求取消订单邮件
    OrderMailer.notify_cancell_order(@order).deliver
    flash[:notice] = '您的申请已经提交'
    redirect_to :back
  end

end
