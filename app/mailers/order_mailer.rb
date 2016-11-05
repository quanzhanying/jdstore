class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore]感谢您完成本次的下单，以下是您这次的购物明细#{order.token}")
  end

  def notify_paid(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore]感谢您完成本次订单的支付，以下是您这次的购物明细#{order.token}")
  end

  def notify_shipped(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore]感谢您,货物已送达，请注意查收，以下是您这次的购物明细#{order.token}")
  end

  def notify_order_cancelled(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "感谢您,我的订单已申请取消，请尽快批准！以下是我这次的订单明细#{order.token}")
  end

  def notify_good_returned(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "感谢您,我的货物已申请退货，以下是我这次的退货清单明细#{order.token}")
  end
end
