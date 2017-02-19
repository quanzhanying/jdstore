module OrdersHelper
  def render_order_paid_state(order)
    if order.is_paid?
      "已经付款"
    else
      "尚未付款"
    end
  end
end
