class Admin::OrdersController < ApplicationController
  layout "admin"

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def cancell_order
    @order = Order.find(params[:id])
    @order.cancell_order!

    flash[:notice] = "订单已取消"
    redirect_to admin_orders_path
  end

  def return_good
    @order = Order.find(params[:id])
    @order.return_good!

    flash[:notice] = "已退货"
    redirect_to admin_orders_path
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!

    flash[:notice] = "出货中"
    redirect_to admin_orders_path
  end

  def deliver
    @order = Order.find(params[:id])
    @order.deliver!

    flash[:notice] = "已到货"
    redirect_to admin_orders_path
  end


end
