class Account::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to account_orders_path
  end



  def cancell_order
    @order = Order.find(params[:id])
    @order.cancell_order = false
    @order.cancell_order!
    #OrderMailer.notify_order_cancelled(@order).deliver!
    redirect_to :back
    flash[:alert] = "订单取消成功"
    @order.save
  end





end
