class Admin::OrdersController < ApplicationController
before_action :authenticated_user!
  before_action :admin_required

  layout 'admin'

  def index
    @orders =Order.order("id DESC")
  end
end
