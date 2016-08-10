class Account::OrdersController < ApplicationController
  def index
    @user = current_user
    @orders = Order.where(user: @user)
  end
end
