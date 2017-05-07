class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_is_admin
    unless current_user.admin?
      redirect_to root_path, alert: "您没有权限！"
    end
  end
end
