class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: "admin@test.com" , subject: "[JDStore] 用户#{order.user.email}申請取消訂單 #{order.token}")
  end

  def notify_ship(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 您的訂單 #{order.token}已發貨")
  end

  def notify_cancel(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 您的訂單 #{order.token}已取消")
  end

  def apply_cancel(order)
    @order       = order
    @user        = order.user
    @product_lists = @order.product_lists

    mail(to: "admin@test.com" , subject: "[JDStore] 用户#{order.user.email}申請取消訂單 #{order.token}")
  end

end
