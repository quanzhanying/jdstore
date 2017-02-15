class Admin::OrdersController < ApplicationController
  layout "admin"

  before_cation :authenticate_user!
  before_action :admin_required

  def index
    @orders = Order.order("id DESC")
  end
end
