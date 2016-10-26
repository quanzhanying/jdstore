class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_admin
    if !current_user.is_admin
     flash[:alert]='You are not the admin!'
     redirect_to products_path
   end
  end
end
