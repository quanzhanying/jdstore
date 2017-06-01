class Account::UsersController < ApplicationController
  # 使用者必須登入
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      redirect_to edit_account_user_path(current_user)
    else
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :birthday, :gender, :phone, :address)
  end
end
