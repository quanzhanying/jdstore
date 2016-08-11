class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @orders = Order.where(user: @user).order('created_at DESC')
  end

  def request_to_cancel
    @order = Order.find(params[:id])
    RequestForCancelOrderMailer.request_for_cancellation(@order).deliver!
  end

  def shipped
    @order = Order.find(params[:id])
    @order.deliver!
    redirect_to :back, notice: '设置到货状态成功~'
  end
end
