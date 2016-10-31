module CartsHelper
  def render_cart_total_price(cart)
     cart.total_price
  end

  def render_cart_destory(cart)
    cart.destory
  end
end
