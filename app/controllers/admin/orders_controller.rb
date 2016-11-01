class Admin::OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin
  layout "admin"

  def index
    @orders = Order.all
  end

end
