class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_admin
    if !current_user.is_admin
      redirect_to "/"
      flash[:alert] = "You are not admin"
    end
  end
  
end
