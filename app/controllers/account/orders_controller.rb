class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def cancel
    @order = Order.find(params[:id])
    @order = @order.cancell_order!
    redirect_to :back
  end
end
