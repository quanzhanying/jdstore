class Cart < ApplicationRecord
	has_many :cart_items
	has_many :products, through: :cart_items, source: :product


	def add_product_to_cart(product)
    ci = cart_items.build
    ci.product = product
    ci.quantity = 1
    ci.save
  end

	def remove_product_from_cart(product)
		# puts '~~~~'
		# puts i
		# puts params[:id]
		cart_item = @cart_items.find(product)
		ci = cart_item.product.destroy(product)
		# ci.product = product
		# ci.quantity = 1
		# ci.save
	end


	def total_price
		sum = 0
		cart_items.each do |cart_item|
		sum += cart_item.quantity * cart_item.product.price
		end
		sum
	end
end
