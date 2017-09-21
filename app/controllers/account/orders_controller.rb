class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @orders = @user.orders.order("id DESC")
  end
end
