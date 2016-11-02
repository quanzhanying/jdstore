class ProductList < ApplicationRecord
	belongs_to :order

	def subtotal_price
		sum = 0
		cart_item(cart_item) do |cart_item|
		sum += cart_item.quantity * cart_item.product.price
		end
		sum
	end

end
