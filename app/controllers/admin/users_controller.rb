class Admin::UsersController < ApplicationController
before_filter :authenticate_user!
before_filter :admin_require
layout "admin"
  def index
    @users = User.all
  end

  def drop
    @user = User.find(params[:id])
    @user.is_admin = false
    @user.save
    redirect_to :back
  end

  def push
    @user = User.find(params[:id])
    @user.is_admin = true
    @user.save
    redirect_to :back
  end

end
