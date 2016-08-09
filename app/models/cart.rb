# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord

	has_many :cart_items, dependent: :destroy
	has_many :items, through: :cart_items, source: :item

	def add_item_to_cart(item)
		ci = cart_items.build
		ci.item = item
		ci.quantity = 1
		ci.save
	end

	def remove_item_from_cart(cart_item)
		cart_item.delete
	end

	def remove_all_item
		self.cart_items.delete_all
	end

	def total_price

		sum = 0
		cart_items.each do |cart_item|
			sum += cart_item.quantity * cart_item.item.price
		end

		return sum
	end

end
