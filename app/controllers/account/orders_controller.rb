class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @order = Order.all
  end
end
