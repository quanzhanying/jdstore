module Admin::OrdersHelper
  def render_order_state(order)
    case order.aasm_state
    when "order_placed"
      content_tag("span", "Unpaid", class: "label label-warning")
    when "Paid"
      content_tag("span", "Paid", class: "label label-success")
    when "shipping"
      content_tag("span", "Shipping", class: "label label-primary")
    when "shipped"
      content_tag("span", "Shipped", class: "label label-default")
    when "order_cancelled"
      content_tag("span", "Cancelled", class: "label label-danger")
    when "good_returned"
      content_tag("span", "Returned", class: "label label-default")
    end
  end
end
