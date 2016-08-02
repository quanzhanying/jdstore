class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_is_admin
    if !current_user.admin?
      flash[:error] = "Not Admin"

      redirect_to root_path
    end
  end
end
