class Account::OrdersController < ApplicationController

  def index
    @orders = current_user.orders.recent
  end

end
