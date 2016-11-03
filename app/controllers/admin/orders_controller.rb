class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @orders = Order.all
  end
end
