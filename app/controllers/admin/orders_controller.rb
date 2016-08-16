class Admin::OrdersController < ApplicationController
  layout "admin"
  def index
    @orders = Order.all
  end
end
