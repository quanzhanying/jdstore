module ProductsHelper
  def render_product_status(product)
    if product.onsale
      content_tag(:span, "", :class => "fa fa-eye")
    else
      content_tag(:span, "", :class => "fa fa-eye-slash")
    end
  end
end
