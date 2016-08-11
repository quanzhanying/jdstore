module Admin::OrdersHelper
  # def render_order_state(order)
  #   case order.aasm_state
  #   when "order_placed"
  #     content_tag("span", "已下单", class:"label label-default")
  #   when "paid"
  #     content_tag("span", "已支付", class:"label label-default")
  #   when "shipping"
  #     content_tag("span", "发货中", class:"label label-default")
  #   when "shipped"
  #     content_tag("span", "已发货", class:"label label-default")
  #   when "order_cancelled"
  #     content_tag("span", "已取消", class:"label label-default")
  #   when "good_returned"
  #     content_tag("span", "已退货", class:"label label-default")
  #   end
  # end

  def render_order_state(order)
    case order.aasm_state
    when "order_placed"
      content_tag("span","已下单", class:"label label-default")
    when "paid"
      content_tag("span","已支付", class:"label label-default")
    when "shipping"
      content_tag("span","发货中", class:"label label-default")
    when "shipped"
      content_tag("span","已发货", class:"label label-default")
    when "order_cancelled"
      content_tag("span","已取消", class:"label label-default")
    when "good_returned"
      content_tag("span","已退货", class:"label label-default")
    end
  end


  # def render_order_state_if(order)
  #   if order.paid?
  #     content_tag("span", "已支付", class:"label label-default")
  #   elsif order.order_placed?
  #     content_tag("span", "已下单", class:"label label-default")
  #   elsif order.shipping?
  #     content_tag("span", "发货中", class:"label label-default")
  #   end
  # end



end
