class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @orders = Order.where(user: @user).order('created_at DESC')
  end
end
