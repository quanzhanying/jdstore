class Admin::OrdersController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @orders = Order.all

  end
end
