class Account::OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)
    #@orders = Order.all
  end
end
