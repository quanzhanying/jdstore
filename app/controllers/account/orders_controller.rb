class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

   def index
     @orders = current_user.orders.order("id DESC").paginate(:page => params[:page], :per_page =>20)
     @aasm_state = Array[["order_placed","已下单"],["paid","已付款"],["shipping","发货中"],["shipped","已收货"],["order_cancelled","取消订单"],["good_returned","退货"]]
   end
end
