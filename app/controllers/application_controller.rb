class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_admin
    if !current_user.is_admin
     redirect_to jobs_path,flash[:alert]='You are not the admin!'
   end
  end
end
