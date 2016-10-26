class Admin::UsersGroupController < ApplicationController
  before_filter :authenticate_user
  before_filter :require_is_admin

  def index
    @users = User.all
  end

  def admin
    @user = User.find(params[:id])
    @user.is_admin = true
    @user.save
    redirect_to user_group_path
  end

  def user
    @user = User.find(params[:id])
    @user.is_admin = false
    @user.save
    redirect_to user_group_path
  end


end
