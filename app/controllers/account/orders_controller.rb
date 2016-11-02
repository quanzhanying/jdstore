class Account::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end
end
