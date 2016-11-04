class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = current_user.orders.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)

  end

  def cancell
    @order = Order.find(params[:id])
    @order.is_cancell = false
    @order.save
    redirect_to :back
  end

  def cancelled
    @order = Order.find(params[:id])
    @order.is_cancell = true
    @order.save
    redirect_to :back
    OrderMailer.notify_order_cancelled(@order).deliver!
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address, :is_paid, :payment_method,:is_cancell,:is_ship)
  end

end
