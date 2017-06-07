class Account::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @url = 1
  end

  def update
    @user = User.find(current_user.id)
      if @user.update_attributes(user_params)
        if params[:user][:image].present?
          render :crop
        else
          redirect_to account_user_url, notice: "用戶資料更新成功."
        end
      else
        redirect_to account_user_url
      end
  end

  private

    def user_params
      params.require(:user).permit(:username, :gender,:image,:crop_x, :crop_y, :crop_w, :crop_h)
    end

end
