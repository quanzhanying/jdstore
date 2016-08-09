class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  layout "admin"

  def index
    @orders = Order.all
  end
end
