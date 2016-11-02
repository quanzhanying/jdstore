class OrderMailer < ApplicationMailer

  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JD Store] Your order is shown below #{order.token}")
  end

  def order_price
    sum = 0
    product_lists.each do |product_list|
      sum += product_list.quantity * product_list.product_price
    end
    sum
  end
  
end
