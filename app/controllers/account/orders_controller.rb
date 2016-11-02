class Account::OrdersController < ApplicationController
  def index
    @order = Order.current_order(current_user)
  end
end
