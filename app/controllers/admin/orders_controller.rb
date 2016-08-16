class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @orders = Order.all
  end

  def cancel
    @order = Order.find(params[:id])
    @order.order_cancelled?
    @order.save
    flash[:notice] = "You have cancelled order."
    redirect_to :back
  end
end
