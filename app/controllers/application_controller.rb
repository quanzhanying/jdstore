class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def admin_required
    redirect_to '/' unless current.user.admin?
  end
end
