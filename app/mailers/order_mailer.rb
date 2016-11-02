class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    
    mail(to: @user.email,
    subject: "[JDstore] 感谢您本次剁手，以下是您的✋。#{order.token}")
  end

  # def product_list_total_price
  #   @order = order
  #   @user = order.user
  #   @product_lists = @order.product_lists
  #
  #   sum = 0
  #   @product_lists.each do |product_list|
  #     sum += product_list.product_price * product_list.quantity
  #   end
  #
  #   return sum
  # end

  # def send_simple_message
  #   RestClient.post "https://api:key-2beaf45e64d9767309ee77ef665957ad"\
  #   "@api.mailgun.net/v3/sandbox4ddf2fb3c1a844e298990a04e795e0dc.mailgun.org/messages",
  #   :from => "Mailgun Sandbox <postmaster@sandbox4ddf2fb3c1a844e298990a04e795e0dc.mailgun.org>",
  #   :to => "韩晗 <hanhan10065034@gmail.com>",
  #   :subject => "Hello 韩晗",
  #   :text => "Congratulations 韩晗, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
  # end
end
