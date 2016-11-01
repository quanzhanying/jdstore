class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_cart

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to "/"
    end
  end

  def current_cart
    @current_cart ||= find_cart
  end

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end

    session[:cart_id] = cart.id
    return cart

  end

end
