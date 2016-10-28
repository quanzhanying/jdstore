class Admin::UsersController < ApplicationController
  before_filter :require_is_admin
  layout "admin"
  def index
    @users = User.all
  end

  def master
    @user = User.find(params[:id])
    @user.master!

    redirect_to :back
  end

  def guest
    @user = User.find(params[:id])
    @user.guest!

    redirect_to :back
  end
end
