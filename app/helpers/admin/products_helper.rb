module Admin::ProductsHelper
  def render_product_recommend_action(product)
    if product.is_recommended?
      link_to("取消推荐", cancel_recommend_admin_product_path(product), method: :post, class: "btn btn-default")
    else
      link_to("设为推荐", recommend_admin_product_path(product), method: :post, class: "btn btn-default")
    end
  end
end
