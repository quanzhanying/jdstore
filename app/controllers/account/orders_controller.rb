class Account::OrdersController < ApplicationController
  layout "admin"

    before_action :authenticate_user!
    before_action :admin_required

  def index
    @orders = current_user.orders.order("id DESC")
  end
end
