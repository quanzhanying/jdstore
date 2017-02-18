module OrdersHelper
  def render_order_paid_state(order)
    if order.is_paid?
      "已付款"
    else
      "未付款"
    end
  end

  def render_order_state(order)
    case order.aasm_state
    when 'order_placed'
      "已下订"
    when 'paid'
      '已付款'
    when 'shipping'
      "出货中"
    when 'shipped'
      "到货"
    when 'order_cancelled'
      "取消订单"
    when 'good_returned'
      "退货"
    end
  end
end
