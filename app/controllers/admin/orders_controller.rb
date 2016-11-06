class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  layout "admin"
  def index
    @orders=Order.all
  end

  def destroy
    @order =Order.find_by_token(params[:id])

    @order.destroy
    redirect_to admin_orders_path ,alert:'order deleted'
  end

  def make_payment
    @order = Order.find_by_token(params[:id])
    @order.maker_payment!
    @order.save
  end

  def ship
    @order = Order.find_by_token(params[:id])
    @order.ship!
    @order.save
  end

  def deliver
    @order = Order.find_by_token(params[:id])
    @order.deliver!
    @order.save
  end

  def return_good
    @order = Order.find_by_token(params[:id])
    @order.return_good!
    @order.save
  end

  def cancell_order
    @order = Order.find_by_token(params[:id])
    @order.cancell_order!
    @order.save
  end

 private

 def order_params
   params.require(:order).permit(:billing_name,:billing_address,:shipping_name,:shipping_address,:token)
 end

end
