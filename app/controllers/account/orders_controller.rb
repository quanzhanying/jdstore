class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.all.where(user_id: current_user.id)
  end
end
