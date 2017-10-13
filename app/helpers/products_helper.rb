module ProductsHelper
  def display_product_status(product)
    case product.status
    when "draft"
      "草稿"
    else
      ""
    end
  end
end
