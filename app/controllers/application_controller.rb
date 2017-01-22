class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_required
  	if !current_user.admin?
  		redirectz_to "/"
  	end
  end
end
