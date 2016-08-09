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

  def render_order_operation_admin(order)
    content = ""
    if order.order_placed? || order.paid? || order.appling_cancel_order?
      content = link_to("Cancle Order", cancle_order_admin_order_path(order.token), class: "btn btn-danger btn-xs", method: :post, data: {confirm: "Are you sure?"})
      if order.paid?
        content +=
        link_to("Ship", ship_order_admin_order_path(order.token), class: "btn btn-primary btn-xs", method: :post, data: {confirm: "Are you sure?"})
      else
        return content
      end
    end
  end


end
