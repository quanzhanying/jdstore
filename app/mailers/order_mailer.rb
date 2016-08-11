class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] Thanks for shopping! Please find the detailed list.")
  end

  def notify_order_cancelled(order)
    @order = order
    @admin = User.where(is_admin: true).first
    @product_lists = @order.product_lists

    mail(to: @admin.email, subject: "[JDStore] Order cancelled! Please find the detailed list below #{order.token}")
  end

  def notify_order_shipping(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] Thanks for shopping! Please find the shipping list below.")
  end

  def notify_order_confirm_cancellation(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] Order cancelled successfully! Please find the detailed list below")
  end
end
