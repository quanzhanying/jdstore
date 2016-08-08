class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout "black"

  def require_is_admin
    @user=current_user
    if @user.is_admin == false
      flash[:alert]="You are not admin!"
      redirect_to root_path
    end
  end
end
