class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 感谢您完成本次的下单，以下是你这次购物明细 #{order.token}")
  end

  def send_simple_message
    RestClient.post "https://api:key-f56622ae1a8e89b54b27b6f7f320399b"\
    "@api.mailgun.net/v3/sandbox9e34d6ef107049c78dac166e186946b0.mailgun.org/messages",
    :from => "Mailgun Sandbox <postmaster@sandbox9e34d6ef107049c78dac166e186946b0.mailgun.org>",
    :to => "hui <tianw3721@gmail.com>",
    :subject => "Hello hui",
    :text => "Congratulations hui, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
  end
      


end
