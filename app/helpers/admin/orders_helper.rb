module Admin::OrdersHelper
  def render_order_state(order)
    case order.aasm_state
    when "order_placed"
      content_tag("span", "未付款", class:"label label-warning")
    when "paid"
      content_tag("span", "已付款", class:"label label-success")
    when "shipping"
      content_tag("span", "已发货", class:"label label-primary")
    when "shipped"
      content_tag("span", "已到货", class:"label label-default")
    when "order_cancelled"
      content_tag("span", "已取消", class:"label label-danger")
    when "good_returned"
      content_tag("span", "已退货", class:"label label-default")
    end
  end
end
