class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

     def index
        @orders = Order.order("id DESC")
     end
   end
