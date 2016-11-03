class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_require
  layout "admin"

  def index
    @orders = Order.all
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!
    redirect_to :back
  end

  def cancell
    @order = Order.find(params[:id])
    @order.cancell_order!
    redirect_to :back
  end

  def return_good
    @order = Order.find(params[:id])
    @order.return_good!
    redirect_to :back
  end

  def deliver
    @order = Order.find(params[:id])
    @order.deliver!
    redirect_to :back
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to :back
  end
end
