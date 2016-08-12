module Account::OrdersHelper

  def render_order_operate(order)
    content_tag(:div) do

      if order.aasm_state=="paid"||order.aasm_state=="order_placed"
        concat "|"
        concat link_to(" 取消订单", appl_cancell_order_account_order_path(order), method: :post) 
      elsif order.aasm_state=="shipped"
        concat "|"
        concat link_to(" 退货申请", appl_return_good_account_order_path(order), method: :post)
      end
    end
  end

  def render_order_delete(order)
    content_tag(:div) do

      if order.aasm_state=="shipped"
        concat "|"
        concat link_to(" 删除", account_order_path(order.token), method: :delete, data: { confirm: "确定要删除订单么?" })
      end
    end
  end
end
