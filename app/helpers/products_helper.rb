module ProductsHelper

  def last_item(index)
    if index > 0 && (index + 1) % 5 == 0
      "productList-lastItem"
    end
  end

  def render_highlight_content(product,query_string)
    excerpt_cont = excerpt(product.title, query_string, radius: 500)
    highlight(excerpt_cont, query_string)
  end
end
