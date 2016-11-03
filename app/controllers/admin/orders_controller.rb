class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  def index
    @orders = Order.all
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    OrderMailer.notify_order_placed(Order.last).deliver!
    redirect_to :back
  end

end
