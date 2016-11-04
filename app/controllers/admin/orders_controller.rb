class Admin::OrdersController < ApplicationController
     before_action :authenticate_user!
     layout "admin"
    def index
      @orders = Order.all

    end

   def ship

     @order = Order.find_by_token(params[:id])
     #binding.pry
     @order.ship!
     @order.save

     redirect_to :back
   end


   def cancell_order
     @order = Order.find_by_token(params[:id])
     @order.cancell_order!
     redirect_to :back

   end

   def deliver
     @order = Order.find_by_token(params[:id])
     @order.deliver!
     redirect_to :back
   end

   def return_good
     @order = Order.find_by_token(params[:id])
     @order.return_good!
     redirect_to :back
   end



end
