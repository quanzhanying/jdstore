class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  layout "admin"

  def adm
    @user = User.find(params[:id])
    @user.adm!
    redirect_to :back
  end

  def usr
    @user = User.find(params[:id])
    @user.usr!
    redirect_to :back
  end

  def index
    @users = User.all.except_user(current_user)
  end


end
