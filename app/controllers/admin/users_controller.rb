class Admin::UsersController < ApplicationController
    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def be_admin

      @is_admin = params[:is_admin]

      @user = User.find(params[:id])

      @str = "";
      if @is_admin==true
        @user.is_admin = true
        @str = "已成为管理员！"
      else
        @user.is_admin = false
        @str = "不再是管理员！"
      end

      if @user.save
        flash[:notice] = @str
      else
        flash[:alert] = "出错了"
      end

      redirect_to admin_users_path
    end
end
