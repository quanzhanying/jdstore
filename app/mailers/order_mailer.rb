class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email,subject: "[JDstore] 感谢您完成本次的下单，以下是您这次购物明细 #{order.token}")
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

      mail(to: @user.email, subject: "[JDStore] 您的订单已取消!XD #{order.token}")
    end


end
