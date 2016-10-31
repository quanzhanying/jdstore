class Admin::UsersController < ApplicationController
  before_action :authenticate_user! , only: [:index]
  before_action :admin_required

  layout "admin"
  def index
    @users = User.all_exceptself(current_user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :back
  end

  def cgadmin
    @user = User.find(params[:id])
    @user.is_admin = 'true'
    @user.save
    redirect_to :back      
  end


  def cguser
    @user = User.find(params[:id])
    @user.is_admin = 'false'
    @user.save

    redirect_to :back        
  end




  private

  def admin_required
    if !current_user.admin?
        redirect_to '/'
    end
  end



  # def user_params
  #   params.require(:user).permit(:title, :description, :image,:quantity, :price)
  # end



end
