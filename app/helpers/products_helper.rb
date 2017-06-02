module ProductsHelper
  def render_product_status(product)
    if product.is_hidden
      content_tag(:span, "", :class => "fa fa-times")
    else
      content_tag(:span, "", :class => "fa fa-check-circle")
    end
  end
end
