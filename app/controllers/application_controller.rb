class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin_required
    redirect_to '/', alert: 'You are not admin.' unless current_user.admin?
  end

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    cart = Cart.create if cart.blank?
    session[:cart_id] = cart.id
    cart
  end
end
