module OrdersHelper

  def render_order_edit_option(order)
    out = ''
     if order.aasm_state == "order_cancelled"
      out = "已取消"
     elsif order.aasm_state == "paid" || order.aasm_state == "order_placed"
      out =  link_to("取消订单", cancel_order_path(order.token),method: :post, class:"btn btn-sm btn-danger" )
     end
     return out
  end
end
