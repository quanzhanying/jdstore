class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = current_user.orders
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    OrderMailer.notify_order_placed(Order.last).deliver!
    redirect_to :back
  end

end
