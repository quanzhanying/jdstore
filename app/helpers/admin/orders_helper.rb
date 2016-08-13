module Admin::OrdersHelper
  def render_order_status(order)
    case order.aasm_state
    when 'order_placed'
      content_tag(:span, "未付款", :class => "strong")
    when 'paid'
      content_tag(:span, "已付款", :class => "strong")
    when 'shipping'
      content_tag(:span, "出货中", :class => "strong")
    when 'shipped'
      content_tag(:span, "到货", :class => "strong")
    when 'order_cancelled'
      content_tag(:span, "已取消", :class => "strong")
    when 'good_returned'
      content_tag(:span, "已退货", :class => "strong")
    end
  end
end
