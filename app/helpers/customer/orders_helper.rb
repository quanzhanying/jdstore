module Customer::OrdersHelper

  def render_order_status_in_index(order)

      link_to(order.order_state, "#", class: "btn btn-default btn-sm", disabled: "disabled")

  end

  def render_payment_status_in_index(order)

    partial_path = "customer/orders/payment_status_" + order.aasm_state
    
    render partial: partial_path, locals: {order: order}

  end

  def render_status_in_show(order)
    link_to(order.order_state, "#", class: "btn btn-primary btn-lg pull-right", disabled: "disabled")
  end

end
