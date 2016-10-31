class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :new_items_for_current_user
  helper_method :orders_not_complete_for_current_user
  helper_method :current_cart


  	def require_is_admin 
		if !current_user.admin?
			redirect_to root_path, alert: "没有管理员权限"
		end
	end

	def cart_items_count
		current_cart.products.count
	end

	def new_items_for_current_user
		CartItem.where(cart_id: current_cart.id).new_added
	end

	def orders_not_complete_for_current_user
		Order.where(user_id: current_user.id).not_finished
	end

	def current_cart
		@current_cart ||= find_cart
	end

	def find_cart

		if current_user
			if current_user.cart
				return current_user.cart
			else
				cart = Cart.new
				current_user.cart = cart
				cart.save
				return cart
			end
		end
	end

	# def find_cart

	# 	if session[:user_id].blank? && current_user
	# 		session[:user_id] = current_user.id
	# 	end

	# 	cart = Cart.find_by(id: session[:cart_id])
	# 	if cart.blank?
	# 		cart = Cart.create
	# 	end
	# 	session[:cart_id] = cart.id
	# 	# binding.pry
	# 	return cart

	# end

	# 	if current_user.cart
	# 		session[:cart_id] = current_user.cart.id
	# 		return current_user.cart
	# 	else
	# 		cart = Cart.new
	# 		current_user.cart = cart
	# 		cart.save
	# 		session[:cart_id] = current_user.cart.id
	# 		return cart
	# 	end
		
	# end

	 
	
end
