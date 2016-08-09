module Admin::OrdersHelper
  def render_order_state(order)
    if order.order_placed?
      content_tag(:span, "Order Placed", class: "label label-warning")

    elsif order.paid?
      content_tag(:span, "Paid", class: "label label-success")

    elsif order.shipping?
      content_tag(:span, "Shipping", class: "label label-info")

    elsif order.shipped?
      content_tag(:span, "Shipped", class: "label label-success")

    elsif order.order_cancelled?
      content_tag(:span, "Order Cancelled", class: "label label-default")

    elsif order.good_returned?
      content_tag(:span, "Good Returned", class: "label label-default")

    elsif order.appling_cancel_order?
      content_tag(:span, "Appling Cancel", class: "label label-danger")

    elsif order.appling_good_return?
      content_tag(:span, "Appling Return", class: "label label-danger")

    else
      ""
    end
  end

  def render_order_operation(order)
    if order.order_placed? || order.paid?
      link_to("Apply cancle", account_order_apply_cancle_order_path(order), class: "btn btn-danger btn-xs", method: :post, data: {confirm: "Are you sure?"})
    elsif order.shipped?
      link_to("Apply return", account_order_apply_return_good_path(order), class: "btn btn-danger btn-xs", method: :post, data: {confirm: "Are you sure?"})
    else
      ""
    end
  end
end
