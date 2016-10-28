class Admin::UsersController < ApplicationController
  before_action :require_is_admin
  layout "sidebar"
  def index
    @users = User.all
  end

  def become_admin
    @user = User.find(params[:id])
    @user.become_admin!
    redirect_to :back
  end

  def become_user
    @user = User.find(params[:id])
    @user.become_user!
    redirect_to :back
  end


  private
  def user_params
    params.require(:user).permit(:is_admin)
  end
end
