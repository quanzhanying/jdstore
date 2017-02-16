class Admin::OrdersController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_require

  def index
    @orders = Order.all.order("created_at DESC")
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def cancel
    @order = Order.find_by_token(params[:id])
    @order.cancel_order!
    OrderMailer.admin_cancel_order(@order).deliver!

    redirect_to :back, notice: "订单取消成功"
  end

  def shipping
    @order = Order.find_by_token(params[:id])
    @order.ship!
    OrderMailer.shipping_order(@order).deliver!

    redirect_to :back, notice: "已经出货"
  end

  def shipped
    @order = Order.find_by_token(params[:id])
    @order.deliver!

    redirect_to :back
  end

  def return
    @order = Order.find_by_token(params[:id])
    @order.return_good!

    redirect_to :back
  end
end
