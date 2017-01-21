class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  def admin_required
    if !current_user.admin?
      redirect_to "/"
    end
  end

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end
end
