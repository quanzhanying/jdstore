class OrderMailer < ApplicationMailer

	def notify_order_placed(order)
		@order = order
		@user = order.user
		@product_lists = @order.product_lists

		mail(to: @user.email, subject: "[DZF] Thank you for your order! Please see your order details here #{order.token}")
	end

	def notify_order_cancelled(order)
		@order = order
		@user = order.user
		@product_lists = @order.product_lists

		mail(to: @user.email, subject: "[DZF] Your Order Has Been Successfully Cancelled #{order.token}")
	end

	def notify_order_shipped(order)
		@order = order
		@user = order.user
		@product_lists = @order.product_lists

		mail(to: @user.email, subject: "[DZF] Your Order Has Been Shipped! #{order.token}")
	end

	def user_wants_cancel(order)
		@order = order
		@user = order.user
		@user.email = order.user.email
		@admin = User.where(is_admin: true)
		@product_lists = @order.product_lists

		mail(to: @admin.first.email, subject: "[DZF] Cancel Order Request From #{@user.email}")
	end

end
