class Admin::UsersController < ApplicationController
before_filter :authenticate_user!
before_filter :admin_require
layout "admin"
  def index
    @users = User.all_except(current_user)
  end

  def user
    @user = User.find(params[:id])
    @user.is_admin = false
    @user.save
    redirect_to :back
  end

  def admin
    @user = User.find(params[:id])
    @user.is_admin = true
    @user.save
    redirect_to :back
  end

end
