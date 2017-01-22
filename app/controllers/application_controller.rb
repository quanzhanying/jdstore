class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
def admin_required
  if !current_user.admin?
    redirect_to products_path
    flash[:alert]= "你不是管理员!"
  end
end
end
