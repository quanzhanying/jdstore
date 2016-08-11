module Account::OrdersHelper
  def render_order_operation(order)
    if order.order_placed? || order.paid?
      link_to("Apply cancle", account_order_apply_cancle_order_path(order), class: "btn btn-danger btn-xs", method: :post, data: {confirm: "Are you sure?"})
    elsif order.shipped?
      link_to("Apply return", account_order_apply_return_good_path(order), class: "btn btn-danger btn-xs", method: :post, data: {confirm: "Are you sure?"})
    elsif order.shipping?
      link_to("Confirm receipt", account_order_confirm_receipt_path(order), class: "btn btn-success btn-xs", method: :post, data: {confirm: "Are you sure?"})
    else
      ""
    end
  end
end
