module ProductsHelper

  def render_product_status(product)
    if product.is_hidden
      content_tag(:span, "", :class => "fa fa-lock")
    else
      content_tag(:span, "", :class => "fa fa-globe")
    end
  end

  def render_is_admin(user)
    if user.is_admin
      "(Admin)"
    else
      "(User)"
    end
  end
end
