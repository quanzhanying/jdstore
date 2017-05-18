module OrdersHelper
  def render_order_state(state)
    case state
    when "order_placed"
      "订单生成,待支付"
    when "paid"
      "订单已支付"
    when "shipping"
      "订单派送中"
    when "shipped"
      "订单已配送"
    when "order_cancelled"
      "订单已取消"
    when "good_returned"
      "已退单"
    end
  end

end
