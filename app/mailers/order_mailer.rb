class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] Thanks for you ordering, this is your order information #{order.token}")
  end

  def notify_order_state_change(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    subject = generate_subject(order)
    mail(from: @user.email, to: "shaojunda@gmail.com", subject: "[JDStore] A customer appling #{subject} , please go to deal with.")
  end


  private

  def generate_subject(order)
    subject = ""
    if order.appling_cancel_order?
      subject = "cancel order"
    elsif order.appling_good_return?
      subject = "return good"
    else
      subject = ""
    end
  end

end
