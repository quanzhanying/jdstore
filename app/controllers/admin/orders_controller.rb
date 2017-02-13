class Admin::OrdersController < ApplicationController

   def show
   @order = Order.find(params[:id])
   @product_lists = @order.product_lists
 end
end
