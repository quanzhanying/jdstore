module ProductsHelper
  def last_item(index)
    if index > 0 && (index + 1) % 5 == 0
      "productList-lastItem"
    end
  end
end
