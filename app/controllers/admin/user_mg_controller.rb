class Admin::UserMgController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  def index
    @users=User.all
  end

  def change_admin
    @user=User.find(params[:id])
    @user.is_admin!
    redirect_to admin_user_mg_index_path
  end


end
