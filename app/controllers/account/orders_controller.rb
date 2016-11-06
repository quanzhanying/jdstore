class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders=current_user.orders
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def cancell_order
    @order = Order.find_by_token(params[:id])
    @order.cancell_order!

    if @order.save
      redirect_to account_orders_path,notice:'订单取消成功'

      # OrderMailer.notify_order_cancelled(@order).deliver!
    end

  end


end
