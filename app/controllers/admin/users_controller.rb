class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :promote, :demote,]
  before_filter :require_is_admin

  layout 'admin'

  def index
    @users = User.all
  end

  def promote
    @user = User.find(params[:id])
    @user.promote!
      redirect_to :back
  end

  def demote
    @user = User.find(params[:id])
    @user.demote!
      redirect_to :back
  end


end
