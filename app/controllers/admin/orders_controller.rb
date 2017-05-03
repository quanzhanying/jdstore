class Admin::OrdersController < ApplicationController

   def show
   @order = Order.find(params[:id])
   @product_lists = @order.product_lists
   end

   def ship
    @order = Order.find(params[:id])
    @order.ship!
    redirect_to :back
  end

  def shipped
    @order = Order.find(params[:id])
    @order.deliver!
    OrderMailer.notify_ship(@order).deliver!
    redirect_to :back
  end

  def cancel
    @order = Order.find(params[:id])
    @order.cancell_order!
    OrderMailer.notify_cancel(@order).deliver!
    redirect_to :back
  end

  def return
    @order = Order.find(params[:id])
    @order.return_good!
    redirect_to :back
  end
end
