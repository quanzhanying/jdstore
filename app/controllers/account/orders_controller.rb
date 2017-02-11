class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = current_user.orders.order("created_at DESC")
  end
end
