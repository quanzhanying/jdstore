class OrderMailer < ApplicationMailer

	def notify_order_placed(order)
		@order = order
		@user = order.user
		@product_lists = @order.product_lists

		mail(to: @user.email, subject: "[DZF] Thank you for your order! Please see your order details here #{order.token}")
	end

end
