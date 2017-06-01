module ProductsHelper
  def trancate(string, length = 20)
	  string.size > length+5 ? [string[0,length],string[-5,5]].join("...") : string
	end

	def last_item(index)
		if index > 0 && (index + 1) % 5 == 0
		  "productList-lastItem"
		end
	end  
end
