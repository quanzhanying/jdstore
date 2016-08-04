class Admin::UsesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  layout "admin"

  def index
    @users = User.all
  end

  def upgrade_to_admin
    @user = User.find(params[:id])
    @user.upgrade_to_admin!
    redirect_to admin_uses_path, notice: "updated to admin success"
  end

  def degrade_to_user
    @user = User.find(params[:id])
    @user.degrade_to_user!
    redirect_to admin_uses_path, notice: "updated to user success"
  end


end
