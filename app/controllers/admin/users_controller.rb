class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def admin
    @user = User.find(params[:id])
    @user.admin!
    redirect_to admin_users_path
  end

  def user
    @user = User.find(params[:id])
    @user.user!
    redirect_to admin_users_path
  end

 end
