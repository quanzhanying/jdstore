class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

     def index
       if !current_user.admin?
         @orders = current_user.orders.order("id DESC")

       else
          @orders = Order.order("id DESC")
        end
     end
   end
