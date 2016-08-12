class Admin::OrdersController < ApplicationController
  layout "admin"

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find_by_token(params[:id])

    @order.destroy
    redirect_to admin_orders_path
  end


  def cancell_order
    @order = Order.find(params[:id])
    @order.cancell_order!

    if Rails.env == "development"
      OrderMailer.notify_cancell_order(@order).deliver!
    end
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

    if Rails.env == "development"
      OrderMailer.notify_ship(@order).deliver!
    end
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
