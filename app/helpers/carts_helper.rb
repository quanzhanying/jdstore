module CartsHelper
  def render_cart_totle_price(cart)
    cart.total_price
  end

  def render_cart_item_cant_negative(cart_item)
    if cart_item.quantity <= 1
      link_to("-", cart_item_path(cart_item),method: :delete,
       :data => { :confirm => "今日不剁再等一年?" }, :class => "btn-default" )
    else
      link_to("-", reduce_quantity_cart_item_path(cart_item),method: :post,
       :class => "btn-default")
    end
  end


end
