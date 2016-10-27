class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destry]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end





end
