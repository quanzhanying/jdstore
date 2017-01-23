class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_required
    unless current_user.admin?
      flash[:warning] = "You have no permission"
      redirect_to root_path
    end
  end
end
