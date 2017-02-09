class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
def admin_required
  if !current_user.admin?
    redirect_to products_path
    flash[:alert]= "你不是管理员!"
  end
end
def current_user_required
  if !current_user
    redirect_to new_user_session_path
    flash[:alert]= "雷超凡提醒您：亲，请先登录！"
  end
end
end
