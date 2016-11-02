class OrderMailer < ApplicationMailer

	default from: "atlantis.ray@gmail.com"

	def order_email(user, order)
    	@user = user
    	@order = order
    	mail(to: @user.email, subject: "Order #{@order.token}已生成")
  	end

  	def test_email
  		mail(to: "atlantis.ray@gmail.com", subject: "test from console")
  	end

  	def order_ship_email(user, order)
  		@user = user
    	@order = order
    	mail(to: @user.email, subject: "Order #{@order.token}已发货")
  	end

  	def order_cancel_email(user, order)
  		@user = user
    	@order = order
    	mail(to: @user.email, subject: "Order #{@order.token}已取消")
  	end

end
