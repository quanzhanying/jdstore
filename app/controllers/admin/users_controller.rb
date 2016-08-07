class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def be_admin
    @user = User.find(params[:id])
    @user.be_admin!
    redirect_to :back
  end

  def be_user
    @user = User.find(params[:id])
    @user.be_user!
    redirect_to :back
  end
