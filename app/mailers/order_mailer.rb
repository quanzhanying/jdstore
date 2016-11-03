class OrderMailer < ApplicationMailer


# From nothing to "order_placed"
	def notify_order_placed(order)
		@order = order
		@user = order.user
		@product_lists = @order.product_lists

		mail(to: @user.email, subject: "[DZF] Thank you for your order! Please see your order details here #{order.token}")
	end

# From "order_placed" to "paid" - NO EMAIL

# FROM "order_placed" or "paid" to "order_cancelled"
	# User initiate
	def user_wants_cancel(order)
		@order = order
		@user = order.user
		@user.email = order.user.email
		@admin = User.where(is_admin: true)
		@product_lists = @order.product_lists

		mail(to: @admin.first.email, subject: "[DZF] Cancel Order Request From #{@user.email}")
	end

	# Admin cancels
	def notify_order_cancelled(order)
		@order = order
		@user = order.user
		@product_lists = @order.product_lists

		mail(to: @user.email, subject: "[DZF] Your Order Has Been Successfully Cancelled #{order.token}")
	end

# From "paid" to "shipping"
	def notify_order_shipped(order)
		@order = order
		@user = order.user
		@product_lists = @order.product_lists

		mail(to: @user.email, subject: "[DZF] Your Order Has Been Shipped! #{order.token}")
	end

# From "shipping" to "shipped" - NO EMAIL

# From "shipped" to "good_returned"
	def user_wants_return(order)
		@order = order
		@user = order.user
		@user.email = order.user.email
		@admin = User.where(is_admin: true)
		@product_lists = @order.product_lists

		mail(to: @admin.first.email, subject: "[DZF] Goods Return Request From #{@user.email}")
	end



	#
	# 	def user_wants_cancel(order)
	# 		@order = order
	# 		@user = order.user
	# 		@user.email = order.user.email
	# 		@admin = User.where(is_admin: true)
	# 		@product_lists = @order.product_lists
	#
	# 		mail to: @admin.first.email, subject: subject_for_user(user)
	#   end
	#
	#   private
	#   def subject_for_user(user)
	#     I18n.translate '[DZF] Cancel Order Request From #{@user.email}', name: user.name
	#   end
	# end
	#
	# # email has the original body; Roadie has not been invoked yet
	# email = OrderMailer.user_wants_cancel(User.first)
	#
	# # This triggers Roadie inlining and will deliver the email with inlined styles
	# email.deliver
end
