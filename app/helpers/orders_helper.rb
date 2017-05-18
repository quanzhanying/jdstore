module OrdersHelper

  def render_order_edit_option(order)
     out = link_to("")
     if order.can_cancel?
      out =  link_to("取消订单", cancel_order_path(order.token),method: :post, class:"btn btn-sm btn-danger",id:"btn-cancel-order")
     end
     if current_user.is_admin && order.can_ship?
       out += link_to("出货", ship_order_path(order.token),method: :post, class:"btn btn-sm btn-danger")
     end
     return out
  end
end
