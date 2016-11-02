class Admin::UsersController < ApplicationController
  layout "admin"

  def index
    @users = User.all_except(current_user)
  end

  def king
    @user = User.find(params[:id])
    @user.king!
    redirect_to :back
  end

  def nobody
    @user = User.find(params[:id])
    @user.nobody!
    redirect_to :back
  end

end
