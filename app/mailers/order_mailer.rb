class OrderMailer < ApplicationMailer
	def notify_order_placed(order)
		@order = order
		@user  = order.user
		@product_lists = @order.product_lists

		mail(to: @user.email, subject:"[JDstore] thank your for the payment, these are your order info #{order.token}")
	end
	def apply_cancel(order)
		@order    = order
		@user     = order.user
		@product_lists = @order.product_lists
		mail(to:"admin@test.com",subject:"[JDstore] User#{order.user.email}apply to cancel #{order.token}")
	end
end
