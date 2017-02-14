class Account::OrdersController < ApplicationController
  def index
    @orders = current_user.orders.order("id DESC")
  end
end
