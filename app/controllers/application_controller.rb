class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_required
  	if !current_user.admin?
  		redirect_to root_path, alert: "You are not admin"
  	end
  end

  helper_method :current_cart

  def current_cart
  	@current_cart ||= find_cart
  end

  private

  def find_cart
  	cart = Cart.find_by_id( session[:cart_id])
  	if cart.blank?
  		cart = Cart.create
  		session[:cart_id] = cart.id
  	end
  	
  	return cart
  end
  
end
