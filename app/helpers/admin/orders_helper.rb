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
      content_tag(:span, "Good Returned", class: "label label-danger")

    else

    end
  end
end
