module Admin::OrdersHelper

  def render_admin_order_operate(order)
    content_tag(:div) do
      if order.aasm_state=="paid"
        concat link_to("发货", ship_admin_order_path(order), method: :post)
      elsif order.aasm_state=="shipping"
        concat link_to("到货", deliver_admin_order_path(order), method: :post)
      elsif order.aasm_state=="order_cancell_appled"
        concat link_to("取消订单", cancell_order_admin_order_path(order), method: :post)
      elsif order.aasm_state=="good_returned_appled"
        concat link_to("退货", return_good_admin_order_path(order), method: :post)
      end
   end
  end

end
