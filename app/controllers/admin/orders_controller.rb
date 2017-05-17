class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout 'admin'

  def index
    @orders = Order.all.order("id DESC")
  end

  private
  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "您没有管理员权限，无法访问本页面"
      redirect_to root_path
    end
  end

end
