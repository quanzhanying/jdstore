class Account::OrdersController < ApplicationController
  def index
    @orders = Order.current_order(current_user).recent
  end
end
