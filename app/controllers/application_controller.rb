class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "You are not admin."
    end
  end

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  private
  def find_cart
    if current_user
      cart = Cart.find_by(user_id: current_user.id)
    else
      cart = Cart.find_by(id: session[:cart_id])
    end

    if cart.blank?
      cart = Cart.create
      cart.user = current_user
      cart.save
    end
    session[:cart_id] = cart.id
    return cart
  end

end
