# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :integer
#  product_id :integer
#  order_id   :integer
#

class CartItem < ApplicationRecord
	belongs_to :cart
	belongs_to :product
	belongs_to :order

	scope :new_added, -> { where(order_id: nil) }

	# 当前用户的为结算商品
	# def self.current_user_new_items
	# 	CartItem.where(cart_id: current_user.cart.id).where(order_id: nil)
	# end

end
