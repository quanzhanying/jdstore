class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 感谢您完成本次订单，以下是您的购物细节 #{order.token}")
  end

  def notify_order_shipping(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 你的货物已发货，以下是您的发货细节 #{order.token}")
  end


  def notify_order_cancelled(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 您的订单已取消，滚！ #{order.token}")
  end

  def send_simple_message
  RestClient.post "https://api:key-9cb5ee7d4912670ac4e113609c057e01"\
  "@api.mailgun.net/v3/sandbox5c3c5ea14c6c426594911dd4df850388.mailgun.org/messages",
  :from => "Mailgun Sandbox <postmaster@sandbox5c3c5ea14c6c426594911dd4df850388.mailgun.org>",
  :to => "nieyicheng <nieyicheng1990@gmail.com>",
  :subject => "Hello nieyicheng",
  :text => "Congratulations nieyicheng, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
  end

end
