class OrderMailer < ApplicationMailer

  def apply_cancel(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    @template_lists = @order.template_lists

    mail(to: "admin@test.com", subject: "[JDStore] 用户#{order.user.email}申请取消订单 #{order.token}")
  end

  def notify(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    @template_lists = @order.template_lists

    case @order.aasm_state
    when "order_placed"
      mail(to: @user.email , subject: "[JDstore] 感谢您完成本次的下单，以下是您这次购物明细 #{order.token}")
    when "shipping"
      mail(to: @user.email, subject: "[JDStore] 您的订单 #{order.token}已发货")
    when "order_cancelled"
      mail(to: @user.email, subject: "[JDStore] 您的订单 #{order.token}已取消")
    end
  end

end
