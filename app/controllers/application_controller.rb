class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_required
    if !current_user.admin?
      flash[:warning] = "你不是管理员，没有权限！"
      redirect_to "/"
    end
  end
end
