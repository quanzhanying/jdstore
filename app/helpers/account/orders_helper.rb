module Account::OrdersHelper
  def render_order_state1(apple)
    case apple.aasm_state
    when 'order_placed'
      render partial: 'account/orders/order_placed_state', locals: { adu: apple }
    when 'shipping'
      link_to('已到货', shipped_account_order_path(apple), method: :post, class: 'btn btn-danger btn-lg')
    when 'paid'
      link_to('申请退款', shipped_account_order_path(apple), method: :post, class: 'btn btn-primary btn-lg')
    when 'shipped'
      link_to('申请退货', request_to_return_account_order_path(apple), method: :post, class: 'btn btn-default btn-lg
')
    end
  end
end
