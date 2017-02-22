module ProductsHelper

  def render_product_description(product) 
    simple_format(product.description)
  end

end
