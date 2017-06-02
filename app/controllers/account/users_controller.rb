class Account::UsersController < ApplicationController
  #必须登录
  before_action :authenticate_user!

  #编辑当前用户资料

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      redirect_to edit_account_user_path(current_user)
      flash[:notice] = '用户资料更新成功'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:address,:phone)
  end

end
