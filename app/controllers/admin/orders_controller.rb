class Admin::OrdersController < ApplicationController
  before_action :authenticate_user! , only: [:index]
  before_action :admin_required

  layout "admin"



  def index
    @orders = Order.all
  end


  # 管理员取消订单
  def order_to_cancell
    @order = Order.find_by_token(params[:id])
    if !@order.cancell_order!
      flash[:notice] = '该订单已被取消'      
    end
    redirect_to :back
    
  end

  # 管理员设置状态至出货
  def order_to_shipping
    @order = Order.find_by_token(params[:id])
    @order.ship!
    ShipOrderMailer.notify_shipping(@order).deliver
    redirect_to :back
  end

  private

  def admin_required
    if !current_user.admin?
      redirect_to '/'
    end
  end

end
