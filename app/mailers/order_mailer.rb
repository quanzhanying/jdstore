class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JDStore] 感谢您完成本次的下单,以下是您这次购物明细 #{order.token}")
  end


#   def send_simple_message
#   RestClient.post "https://api:key-4e1095c58769067574b84ec9ffdc8935"\
#   "@api.mailgun.net/v3/sandbox8d836613ad8848b1a7040eca51f5a588.mailgun.org/messages",
#   :from => "Mailgun Sandbox <postmaster@sandbox8d836613ad8848b1a7040eca51f5a588.mailgun.org>",
#   :to => "kevinsun <no4long@gmail.com>",
#   :subject => "Hello kevinsun",
#   :text => "Congratulations kevinsun, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
# end
end
