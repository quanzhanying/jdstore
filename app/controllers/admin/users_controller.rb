class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin

  layout 'admin'

  def index
    @users = User.all_except(current_user)
  end

  def administrator
    @user = User.find(params[:id])
    @user.is_admin = true
    @user.save

    redirect_to admin_users_path
  end

  def consumer
    @user = User.find(params[:id])
    @user.is_admin = false
    @user.save

    redirect_to admin_users_path
  end


end
