class Admin::OrdersController < ApplicationController
  layout "admin"
  def index
    @orders = Order.all
  end
  
  def destroy
    @order = Order.find_by_token(params[:id])

    @order.destroy
    redirect_to orders_path,alert: '訂單已刪除'
  end
end
