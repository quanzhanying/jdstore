class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @users = User.all.order("created_at DESC")
  end

  def admin
    @user = User.find(params[:id])
    @user.is_admin = false
    @user.save
    redirect_to :back
  end

  def user
    @user = User.find(params[:id])
    @user.is_admin = true
    @user.save

    redirect_to :back
  end

end
