module Customer::OrdersHelper

  def render_payment_status(order)

    if order.is_paid
      link_to("已付款", "#", class: "btn btn-default btn-lg pull-right", disabled: "disabled")
    else
      render "customer/orders/payment_part"
    end 
  end

end
