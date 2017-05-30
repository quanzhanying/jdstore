class ApplicationController < ActionController::Base
  before_action :configure_permitted_parametes, if: :devise_controller?
  protect_from_forgery with: :exception

  def admin_required
    if !current_user.admin?
      flash[:alert] = "你没有权限"
      redirect_to root_path
    end
  end

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    return cart
  end

  protected

  def configure_permitted_parametes
    devise_parameter_sanitizer.permit(:sign_up, keys: [:is_admin,:username])
  end

end
