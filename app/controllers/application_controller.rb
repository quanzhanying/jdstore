class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = 'You are not admin.'
      redirect_to root_path
    end
  end

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  # def out_of_stock
  # end

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
