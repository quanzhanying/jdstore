module ProductsHelper
  def trancate(string, length = 20)
	  string.size > length+5 ? [string[0,length],string[-5,5]].join("...") : string
	end

	def last_item(index)
		if index > 0 && (index + 1) % 5 == 0
		  "productList-lastItem"
		end
	end

  # 搜索#
  def render_highlight_content(product,query_string)
    excerpt_cont = excerpt(product.title, query_string, radius: 500)
    highlight(excerpt_cont, query_string)
  end

end
