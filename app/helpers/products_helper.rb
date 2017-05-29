module ProductsHelper
  def render_highlight_content(product,query_string)
    excerpt_cont = excerpt(product.name, query_string, radius: 500)
    highlight(excerpt_cont, query_string)
  end

  def render_active(index)
    if index == 0
      "active"
    end
  end 
end
