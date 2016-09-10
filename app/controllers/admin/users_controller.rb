class Admin::UsersController < ApplicationController
  before_action :authenticate_user!


  def index
    @users = User.all
  end

  def promote
    @user = User.find(params[:id])
    @user.is_admin = true
    @user.save
    flash[:notice] = "已将该用户权限提升为管理员!"
    redirect_to :back
  end


  def demote
    @user = User.find(params[:id])
    if @user.email != "admin@gmail.com"
       @user.is_admin = false
       @user.save
    flash[:alert] = "已将该用户权限降为普通用户!"
   else
    flash[:alert] = "非法操作，超级管理员不可被降权限！"
   end
    redirect_to :back
end
end
