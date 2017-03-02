module ProductsHelper
  
  def render_special_filter_class(product)
    if product.category == '各种肉'
      'meat'
    elsif product.category == '粗粮'
      'grain'
    elsif product.category == '地方特色'
      'someregion'
    end
  end





end
