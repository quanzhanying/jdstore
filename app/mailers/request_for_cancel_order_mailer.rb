class RequestForCancelOrderMailer < ApplicationMailer
  def request_for_cancellation(order)
    @order = order
    @admin = User.where(is_admin: true).first
    mail(to: @admin.email, subject: "你收到了一个【取消订单】申请，请及时处理 #{@order.token}")
  end
end
