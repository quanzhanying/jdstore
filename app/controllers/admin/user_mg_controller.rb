class Admin::UserMgController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  def index
    @users=User.all
  end

  def change_admin
    @user=current_user
    @user.is_admin!
    redirect_to admin_user_mg_index_path
  end


end
