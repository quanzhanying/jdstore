class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  layout "admin"

  def index
    @orders = Order.all.recent
  end


  def cancle_order
      order = Order.find_by_token(params[:id])
      if order.cancle_order!
        flash[:notice] = "Successfully cancled."
      else
        flash[:alert] = "Faild cancle."
      end
      redirect_to admin_orders_path
  end

  def ship_order
    order = Order.find_by_token(params[:id])
    if order.ship_order!
      flash[:notice] = "Successfully Shipped."
    else
      flash[:alert] = "Faild Ship."
    end
    redirect_to admin_orders_path
  end

end
