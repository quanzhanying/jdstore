module ProductsHelper

  def index_of_category(product)
    ret_index = 0
    ProductCategory.all.each_with_index do |cate, index|
      if cate.name == product.category
        ret_index = index
        break
      end
    end
  end

  def render_product_sum_info(product)
     if product.prodcut_type == "toy"
       render partial: "toy_sum_info", locals: {product: product}
     elsif product.prodcut_type == "eat"
       render partial: "eat_sum_info", locals: {product: product}
     elsif product.prodcut_type == "cloth"
       render partial: "cloth_sum_info", locals: {product: product}
     else
       render partial: "toy_sum_info", locals: {product: product}
     end
  end
end
