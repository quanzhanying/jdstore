class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show

    @order = Order.find_by_token(params[:id])
    #render :text => params[:token]
    #flash[:notice] = @order.billing_name
    #flash[:notice] = @order.id
    @product_lists = @order.product_lists
  end

  def destroy
    @order = Order.find_by_token(params[:id])

    @order.destroy
    redirect_to account_orders_path
  end

  #清空订单
  def clear_order
    current_user.orders.destroy_all
    flash[:alert] = "订单已清空"
    redirect_to account_orders_path
  end

  def appl_cancell_order
    @order = Order.find(params[:id])
    @order.appl_cancell_order!

    if Rails.env == "development"
      OrderMailer.notify_order_cancell_appl(@order).deliver!
    end

    flash[:notice] = "订单取消申请中"
    redirect_to account_orders_path
  end

  def appl_return_good
    @order = Order.find(params[:id])
    @order.appl_good_returned!

    flash[:notice] = "退货申请中"
    redirect_to account_orders_path
  end
end
