class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.all
  end

end
