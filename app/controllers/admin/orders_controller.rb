class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  layout "admin" 
  def index
    @orders=Order.all
  end
end
