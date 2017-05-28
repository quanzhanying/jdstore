class Account::UsersController < ApplicationController
  before_action :authenticate_user!

  # 编辑当前用戶资料

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      redirect_to products_path
      flash[:notice] = '用戶資料更新成功'
    else
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :address, :username, :phonenumber)
  end

end
