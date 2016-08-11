module Customer::OrdersHelper

  def render_payment_status_in_show(order)

    if order.paid?
      link_to("已付款", "#", class: "btn btn-default btn-lg pull-right", disabled: "disabled")
    else
      render partial: "customer/orders/payment_part_in_show_page", locals: {order: order}
    end

  end

  def render_payment_status_in_index(order)

    if order.paid?
      render partial: "customer/orders/payment_part_in_index_page_paid", locals: {order: order}
    else
      render partial: "customer/orders/payment_part_in_index_page_unpaid", locals: {order: order}
    end 

  end

end
