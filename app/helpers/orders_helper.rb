module OrdersHelper
  def render_order_paid_state(order)
    if order.is_paid?
      "Have paid"
    else
      "Haven't paid"
    end
  end
end
