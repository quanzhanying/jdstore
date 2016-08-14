class Admin::UsersController < ApplicationController
  before_action :authenticate_user!


  def index
    @users = User.all
  end

  def publish
    @user = User.find(params[:id])
    @user.is_admin = true
    @user.save
    redirect_to :back, notice: "Update Admin"
  end


  def hide
    @user = User.find(params[:id])
    @user.is_admin = false
    @user.save
    redirect_to :back, alert: "Cancel Admin"
  end
end
