class Account::OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end
end
