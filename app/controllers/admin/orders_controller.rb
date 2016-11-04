class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"
  def index
    @orders = Order.all
  end
  def show
    @order = Order.find_by_token(params[:id])
  end

  def notify_order_placed
    @order = Order.find_by_token(params[:id])
    @product = product_list.product
    OrderMailer.notify_order_placed(@order).deliver!

  end

  def cancell
    @order = Order.find(params[:id])
    @order.is_cancell = true
    @order.save
    redirect_to :back
    OrderMailer.notify_order_cancelled(@order).deliver!
  end

 def cancelled
   @order = Order.find(params[:id])
   @order.is_cancell = true
   @order.save
   redirect_to :back
   OrderMailer.notify_order_cancelled(@order).deliver!
 end

  def shipping
    @order = Order.find(params[:id])
    @order.is_ship = false
    @order.save
    redirect_to :back
  end

  def shipped
    @order = Order.find(params[:id])
    @order.is_ship = true
    @order.save
    redirect_to :back
    OrderMailer.notify_shipped(@order).deliver!
  end


  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address, :is_paid, :payment_method,:is_cancell,:is_ship)
  end

end
