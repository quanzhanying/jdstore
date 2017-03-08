module CartsHelper
  def render_cart_total_price(cart)
    cart.total_price
    # sum = 0
    # cart.cart_items.each do |cart_item|
    #   if cart_item.product.price.present?
    #     sum += cart_item.quantity * cart_item.product.price
    #   end
    # end
    # sum
  end
end
