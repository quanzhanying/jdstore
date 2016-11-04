class OrderMailer < ApplicationMailer

  # 提示购物明细
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject:"[JDStore]感谢您完成本次下单，以下是您的购物明晰 #{order.token}")
  end

  # 提示发货
  def notify_shipping(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject:"[JDStore]您的订单 #{order.token} 已发货，请注意查收")
  end

  # 提示用户申请取消
  def notify_cancell_order(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: 'admin@jdstore.com', subject:"[JDStore]请求退订 #{order.token}")
  end

  # 提示管理员取消
  def notify_admin_cancell_order(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject:"[JDStore]您的订单 #{order.token} 已经被退订")
  end


  # def send_simple_message
  #   puts 'send'
  #   RestClient.post "https://api:key-06bf80eb430e74e4027cd3650a7fae30"\
  #   "@api.mailgun.net/v3/sandbox91c0b00280e74dd89f12e086c7870f4f.mailgun.org/messages",
  #   :from => "Mailgun Sandbox <postmaster@sandbox91c0b00280e74dd89f12e086c7870f4f.mailgun.org>",
  #   :to => "liangchaob <liangchaob@163.com>",
  #   :subject => "Hello liangchaob show2",
  #   :text => "<h1>h1<h1>~~~~Congratulations liangchaob, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
  # end
    

end
