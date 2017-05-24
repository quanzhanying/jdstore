class Admin::OrdersController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_requited

  def index
    @orders = Order.order("in DESC")
  end

  def Show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end
end
