class Admin::OrdersController < ApplicationController
  before_action:authenticate_user!
  before_action:admin_required
  layout "admin"
  def index
    @orders = Order.all
  end

  def show

    @order = Order.find_by_token(params[:id])
  end

  def cancel
    @order = Order.find_by_token(params[:id])
    @order.cancell_order!
    redirect_to :back, notice:'确认取消订单请求！'

  end

  def deliver
       @order = Order.find_by_token(params[:id])
       @order.deliver! 
       redirect_to :back, notice:'确认取消订单请求！'
    end


end
