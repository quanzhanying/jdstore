module CartsHelper
  def render_cart_total_price(cart)
    cart.total_price
  end

  def clean!
    cart_items.destroy_all
  end
end
