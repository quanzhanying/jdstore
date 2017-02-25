module ProductsHelper
  def render_highlight_content(product,query_string)
    excerpt_cont = excerpt(product.title, query_string, radius: 500)
    if excerpt_cont.present?
      highlight(excerpt_cont, query_string,highlighter: '<strong style="color: red;">\1</strong>')
    else
      product.title
    end
  end
end
