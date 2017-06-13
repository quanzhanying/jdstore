class Account::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
   @users = User.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "信息更新成功"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :gender, :is_fitting)
  end

end
