module OrdersHelper
  def render_order_paid_state(order)
    if order.is_paid?
      "已付款"
    else
      "未付款"
    end
  end

  def render_order_created_time(order)
    order.created_at.to_s(:long)
  end

end
