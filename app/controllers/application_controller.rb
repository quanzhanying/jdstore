class ApplicationController < ActionController::Base
  layout "admin"
    before_action :authenticate_user!
    before_action :admin_required

  protect_from_forgery with: :exception

  def admin_required
   if !current_user.admin?
     redirect_to "/", alert: "You are not admin."
   end
 end

end
