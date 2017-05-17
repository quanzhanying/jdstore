class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"


  # ---CRUD---

  def index
    @orders = Order.order("id DESC")
  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end


  # ---admin权限---

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "你没有管理员权限!"
    end
  end

end
