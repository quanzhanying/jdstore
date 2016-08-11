class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] Thanks for you ordering, this is your order information #{order.token}")
  end

  def notify_order_state_change(order, role)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    subject = generate_subject(order)

    case role
      when "user"
        mail(from: @user.email, to: "shaojunda@gmail.com", subject: "[JDStore] A customer#{subject} , please go to deal with.")
      when "admin"
          @role = "admin"
          mail(to: @user.email, subject: "[JDStore] Your order #{subject} , please go to check.")
    end

  end


  private

  def generate_subject(order)
    subject = ""
    if order.appling_cancel_order?
      subject = " appling cancel order"
    elsif order.appling_good_return?
      subject = " appling return good"
    elsif order.shipped?
      subject = "'s good is shipped."
    elsif order.order_cancelled?
      subject = "is canclled"
    elsif order.shipping?
      subject = "is shipping"
    else
      subject = ""
    end
  end

end
