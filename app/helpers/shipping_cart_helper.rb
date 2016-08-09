module ShippingCartHelper
  def render_cart_total_price(cart)
    cart.total_price
  end

  def set_product_instore_outstore(product)
    if product.store == 0
      content_tag(:span, "商品缺货")

    else
      content_tag(:span, "商品有货")
    end
  end
end
