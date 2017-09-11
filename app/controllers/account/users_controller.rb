class Account::UsersController < ApplicationController
  before_action :authenticate_user!
  layout "account"

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      flash[:notice] = "信息更新成功"
      redirect_to edit_account_user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :avatar, :summary)
  end

end
