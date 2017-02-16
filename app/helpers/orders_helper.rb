module OrdersHelper

  def render_order_paid_state(order)
    if order.is_paid?
      "Paid"
    else
      "Unpaid"
    end
  end

end
