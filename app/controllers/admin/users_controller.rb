class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @users = User.all
  end

  def change_to_admin
    @user = User.find(params[:id])
    @user.change_to_admin!
    redirect_to :back
  end

  def change_to_user
    @user = User.find(params[:id])
    @user.change_to_user!
    redirect_to :back
  end


  private

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end

end
