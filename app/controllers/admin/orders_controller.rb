class Admin::OrdersController < ApplicationController
  before_action :admin_required
  layout "admin"
end
