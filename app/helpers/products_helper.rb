module ProductsHelper

  def render_product_image(product, style)
    if product.images.present?
      image_tag(product.images[0].thumb.url, class: style)
    else
      image_tag("no-image.jpg", class: style)
    end
  end

  def render_product_detail_image(product)
    if product.images.present?
      image_tag(product.images[0].medium.url, class: "product-img")
    else
      image_tag("no-image.jpg", class: "product-img")
    end
  end

end
