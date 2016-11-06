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
    @order.cancell_order!
    OrderMailer.notify_admin_cancell_order(@order).deliver    
    flash[:notice] = '该订单已被取消'  
    redirect_to :back
    
  end

  # 管理员设置状态至出货
  def order_to_shipping
    @order = Order.find_by_token(params[:id])
    @order.ship!
    OrderMailer.notify_shipping(@order).deliver
    flash[:notice] = '该订单已出货' 
    redirect_to :back
  end






  private

  def admin_required
    if !current_user.admin?
      redirect_to '/'
    end
  end

end
