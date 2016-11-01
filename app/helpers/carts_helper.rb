module CartsHelper

  def render_cart_total_price(cart)
    cart.total_price
    # sum = 0
    # cart.cart_items.each do |cart_item|
    #   sum = sum + cart_item.quantity * cart_item.product.price 
    # end
    # return sum
  end

end
