class Account::OrdersController < ApplicationController

  def index
    @orders = current_user.orders.all
  end


end
