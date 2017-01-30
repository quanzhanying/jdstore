class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin_required
    redirect_to '/', alert: 'You are not admin.' unless current_user.admin?
  end
end
