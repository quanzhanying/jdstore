module Admin::OrdersHelper
  def render_order_state(o)
    case o.aasm_state
    when 'order_placed'
      link_to('确认取消', order_cancelled_admin_order_path(o), method: :post, class: 'btn  btn-default btn-default')
    when 'paid'
      link_to('发货', shipping_admin_order_path(o), method: :post, class: 'btn btn-default btn-danger')
    when 'shipped'
      link_to('确认退货', good_returned_admin_order_path(o), method: :post, class: 'btn btn-primary btn-default')
    end
  end
end
