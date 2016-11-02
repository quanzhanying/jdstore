class Account::OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find_by_token(params[:id])
  end

end
