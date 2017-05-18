class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout 'admin'

  def index
    @orders = Order.all.order("id DESC")
  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end

  def cancel
    @order = Order.find(params[:id])
    if @order.cancel_order!
      flash[:notice] = "管理员已将订单取消"
    else
      flash[:warning] = "管理员取消订单失败"
    end

    OrderMailer.notify_order_cancelled_by_admin(@order).deliver!

    redirect_to admin_orders_path
  end

  def ship
    @order = Order.find(params[:id])
    if @order.ship!
      flash[:notice] = "管理员已为订单发货"
    else
      flash[:warning] = "管理员设置订单为发货状态失败"
    end

    OrderMailer.notify_order_shipping(@order).deliver!

    redirect_to admin_order_path
  end

  def shipped
    @order =  Order.find(params[:id])
    @order.deliver!

    redirect_to :back
  end

  def return
    @order = Order.find(params[:id])
    @order.return_good!

    OrderMailer.notify_order_cancelled_by_admin(@order).deliver!

    redirect_to :back
  end


  private
  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "您没有管理员权限，无法访问本页面"
      redirect_to root_path
    end
  end

end
