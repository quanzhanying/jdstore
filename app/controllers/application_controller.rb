class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart
  before_action :set_time_zone

  def set_time_zone
    if current_user && current_user.time_zone
      Time.zone = current_user.time_zone
    end
  end

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "You are not admin"
    end
  end

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

end
