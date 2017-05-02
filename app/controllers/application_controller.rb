class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def admin_required
    if !current_user.admin?
      flash[:alert] = "You are not admin"
      redirect_to "/"
    end
  end
end
