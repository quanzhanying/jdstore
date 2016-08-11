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
end
