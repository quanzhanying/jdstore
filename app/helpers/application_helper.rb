module ApplicationHelper
  def render_shipping_cart
    content_tag(:span, "", :class => "fa fa-cart-plus")
  end
end
