class OrderMailer < ApplicationMailer

	def notify_order_placed(order)
		@order = order
		@user = order.user
		@product_lists = @order.product_lists

		mail(to: @user.email, subject: "[DZF] Thank you for your order! Please see your order details here #{order.token}")
	end

	def notify_user_cancel(order)
		@order = order
		@user = order.user
		@admin = User.where(is_admin: true)
		@product_lists = @order.product_lists

		mail(to: @admin.email, subject: "[DZF] Cancel Order Request From #{user.email}")
	end


end
