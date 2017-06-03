class ApplicationController < ActionController::Base
  before_action :store_current_location, :unless => :devise_controller?   # 用户登陆后返回登陆前页面
  protect_from_forgery with: :exception
  def require_is_admin
    if !current_user.admin?
      redirect_to root_path, alert: "你没有权限执行相关操作"
    end
  end

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  private

  # 用户登陆后返回登陆前页面
  def store_current_location
    if request.format == "text/html" || request.content_type == "text/html"
      store_location_for(:user, request.url)
    end
  end
  def after_sign_out_path_for(resource)
    request.referrer || root_path
  end
  # 用户登陆后返回登陆前页面结束

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    return cart
  end
end
