class OrderMailer < ApplicationMailer
	def notify_order_placed(order)
		@order = order
		@user = order.user
		@product_lists = @order.product_lists

		mail(to: @user.email, subject: "[Lanxin's Store]Thank you for shopping,this' your order detail &nbsp #{order.token}")
	end


	def apply_cancel(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists

    #mail(to: "admin@site.com", subject: "[Lanxin's Store] 用户#{order.user.email}申请取消订单 #{order.token}")
    #mail(to: @admin.email, subject: "[Lanxin's Store] 您已申請取消訂單 #{order.token}")
  end

  def notify_ship(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[Lanxin's Store] 您的订单 #{order.token}已发货")
  end

  def notify_cancel(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[Lanxin's Store] 您的订单 #{order.token}已取消")
  end
end
