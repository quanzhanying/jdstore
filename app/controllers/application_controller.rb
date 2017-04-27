class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_is_admin
    if !current_user.admin?
      flash[:warning] = "You are not admin"
      redirect_to "/"
    end
  end

end
