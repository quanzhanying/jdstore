class Admin::OrdersController < ApplicationController
  layout "admin"

  bofore_action :authenticate_user!
  before_action :admin_required
  def index
    @orders = Order.new("id DESC")
  end
end
end
