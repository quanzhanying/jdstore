class Admin::UsersController < ApplicationController
    layout "admin"

  def index
    @users = User.all
  end

  def admin
    @user = User.find(params[:id])
    @user.admin!
    redirect_to :back
  end

  def user
    @user = User.find(params[:id])
    @user.user!
    redirect_to admin_users_path
  end

 end
