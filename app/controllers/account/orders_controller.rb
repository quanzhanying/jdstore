class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.order("id DESC")
    @orders = @orders.paginate(:page => params[:page], :per_page => 10)
  end
end
