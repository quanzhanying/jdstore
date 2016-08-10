module OrdersHelper
  def pay_status(order)
    order.pay_status
  end

  def render_payment_method(order)
    #没有支付的话展示支付按钮
    if !order.is_paid
      content_tag(:div) do
        concat link_to("支付宝支付", go_pay_order_path(@order,payment_method:"ali"), method: :post, class: "btn btn-sm btn-danger")
        concat " "
        concat link_to("微信支付", go_pay_order_path(@order,payment_method:"wx"), method: :post, class: "btn btn-sm btn-danger",style: "margin-left:10px")
      end
    end
  end
end
