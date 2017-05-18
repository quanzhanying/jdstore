class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  layout "admin"

  def index
    if current_user.is_admin
      @orders = Order.all.order("created_at")
    else
      redirect_to root_path
    end
  end

end
