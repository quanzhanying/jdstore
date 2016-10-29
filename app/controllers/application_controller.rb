class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  	def require_is_admin 
		if !current_user.admin?
			redirect_to root_path, alert: "没有管理员权限"
		end
	end

	def cart_items_count
		current_cart.products.count
	end

	def current_cart

		session[:user_id] = current_user.id

		if current_user.cart
			session[:cart_id] = current_user.cart.id
			return current_user.cart
		else
			cart = Cart.new
			current_user.cart = cart
			cart.save
			return cart
		end
		
	end

	 
	
end
