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

end
