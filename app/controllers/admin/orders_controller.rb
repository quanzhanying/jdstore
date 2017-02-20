class Admin::OrdersController < ApplicationController
  layout "admin"

  def index
    @orders = Order.all.order("id DESC")
  end
end
