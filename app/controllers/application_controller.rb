class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_reqiured
    if !current_user.admin?
      redirect_to "/"
      flash[:alert] = "你不是管理员，没有这个权限！"
    end
  end
end
