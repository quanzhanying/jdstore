module ProductsHelper
  def render_product_status(product)
    if product.is_hidden
      "(Hidden)"
    else
      "(Public)"
    end
  end
end
