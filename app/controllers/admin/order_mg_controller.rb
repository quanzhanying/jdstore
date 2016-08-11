class Admin::OrderMgController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  def index
    # @users = User.all
    @orders = case params[:order]
    when "by_order_total"
        Order.order("total DESC")
      when "by_created_time"
        Order.order("created_at DESC")
      else "by_user"
        Order.order("user_id DESC")
      end
  end
end
