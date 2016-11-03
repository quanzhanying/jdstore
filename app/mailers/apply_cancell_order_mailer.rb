class ApplyCancellOrderMailer < ApplicationMailer

  def notify_cancell_order(order)
    @order = order
    @user = order.user_id
    @product_lists = @order.product_lists

    mail(to: 'admin@jdstore.com', subject:"[JDStore]请求退订 #{order.token}")
  end

end
