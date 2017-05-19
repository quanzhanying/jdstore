class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_is_admin
    if !current_user.is_admin?
      redrirect_to root_path, alert:"You are not administrator!"
    end
  end
end
