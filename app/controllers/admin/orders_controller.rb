class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @orders = Order.order("id DESC")
  end


  # ---admin权限---

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "你没有管理员权限!"
    end
  end

end
