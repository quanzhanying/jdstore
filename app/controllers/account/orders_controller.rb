class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  layout "account"

  def index
    @orders = current_user.orders.order("id DESC")         # 用户的所有订单
  
  end



end
