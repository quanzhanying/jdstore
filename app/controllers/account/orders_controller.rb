class Account::OrdersController < ApplicationController
  def index
    @orders = current_user.orders.all
  end

  def cancel_order
    @order = current_user.orders.find(params[:id])
    @order.cancel!
  end
end
