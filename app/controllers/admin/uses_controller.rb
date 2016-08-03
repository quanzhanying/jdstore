class Admin::UsesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  layout "admin"

  def index
    @users = User.all
  end

  def to_admin
    @user = User.find(params[:id])
    @user.to_admin!
    redirect_to admin_uses_path, notice: "updated to admin success"
  end

  def to_user
    @user = User.find(params[:id])
    @user.to_user!
    redirect_to admin_uses_path, notice: "updated to user success"
  end


end
