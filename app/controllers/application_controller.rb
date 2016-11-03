class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_required
    redirect_to '/' unless current_user.admin?
  end

  helper_method :current_cart
  helper_method :current_item

  def current_cart
    @current_cart ||= find_cart
  end

 def current_item
   @current_item ||= find_item
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

  def find_cart_item
    cart_item = Cart_item.find_by(id: session[:cart_item_id])
    if cart_item.blank?
      cart_item = Cart_item.build
    end
    session[:cart_item_id] = cart_item.id
    return cart_item
  end

end
