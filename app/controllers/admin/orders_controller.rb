class Admin::OrdersController < ApplicationController
  @order = Order.all

  def index
    @order = Order.all
  end
end
