class Account::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      flash[:notice] = '用戶資料更新成功'
    end
    redirect_to account_user_url
  end

  private

    def user_params
      params.require(:user).permit(:username, :gender,:image)
    end

end
