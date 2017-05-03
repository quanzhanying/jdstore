class ApplicationMailer < ActionMailer::Base
  default from: 'service@jdstore.com'
  layout 'mailer'
  def apply_cancel(order)
    @order       = order
    @user        = order.user
    @product_lists = @order.product_lists

    mail(to: "admin@test.com" , subject: "[JDStore] 用户#{order.user.email}申请取消订单 #{order.token}")
  end
end
