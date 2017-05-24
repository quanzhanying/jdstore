class Admin::OrdersController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_requited

  def index
    @orders = Order.order("in DESC")

  end
end
