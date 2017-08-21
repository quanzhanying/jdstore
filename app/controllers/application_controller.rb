class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_reqiured
    if !current_user.admin?
      redirect_to "/"
      flash[:alert] = "你不是管理员，没有这个权限！"
    end
  end

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  private

  def find_cart
    cart = Cart.fing_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    return cart
  end
end
