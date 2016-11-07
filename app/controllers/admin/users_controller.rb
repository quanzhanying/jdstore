class Admin::UsersController < ApplicationController
    before_action :require_is_admin
    layout "admin"


  def Adm
    @user = User.find(params[:id])
    @user.Adm!
    redirect_to :back
  end

  def Use
    @user = User.find(params[:id])
    @user.Use!
    redirect_to :back
  end


  def index
    @users = User.all
  end



  def destroy
    @user = User.find(params[:id])

    @user.destroy

    redirect_to admin_users_path
  end



  private

  def user_params
    params.require(:user).permit(:email, :is_admin)
  end


end
