class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @users = User.all
  end

  def turn_to_admin
    @user = User.find(params[:id])
    @user.is_admin = true
    @user.save
   # @user.turn_to_admin!
    redirect_to :back
  end

  def turn_to_user
    @user = User.find(params[:id])

    #@user.turn_to_user!
    @user.is_admin = false
    @user.save

    redirect_to :back
  end


  private
end
