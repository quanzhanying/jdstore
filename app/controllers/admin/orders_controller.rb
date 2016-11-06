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
    if @order.save
      redirect_to admin_orders_path,notice:'订单发货成功'

      # OrderMailer.notify_shipping(@order).deliver!
    end
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
    if @order.save
      redirect_to admin_orders_path,notice:'订单取消成功'

      # OrderMailer.notify_order_cancelled(@order).deliver!
    end

  end

 private

 def order_params
   params.require(:order).permit(:billing_name,:billing_address,:shipping_name,:shipping_address,:token)
 end

end
