module Admin::OrdersHelper

  def render_order_status_in_admin(order)

      link_to(order.order_state, "#", class: "btn btn-default btn-sm", disabled: "disabled")

  end

  def render_operations_in_admin(order)

    partial_path = "admin/orders/payment_status_" + order.aasm_state
    
    render partial: partial_path, locals: {order: order}

  end

  def render_status_in_admin_show(order)
    link_to(order.order_state, "#", class: "btn btn-primary btn-lg pull-right", disabled: "disabled")
  end

end
