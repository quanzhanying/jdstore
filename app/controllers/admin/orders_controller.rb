class Admin::OrdersController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @orders = Order.order("id DESC")
  end
end
