module Admin::ProductsHelper
  def render_product_status(product)
    if product.is_published
      content_tag(:span, "Published")
    else
      content_tag(:span, "Hidden")
    end
  end
end
