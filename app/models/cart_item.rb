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
#

class CartItem < ApplicationRecord
	belongs_to :cart
	belongs_to :product
end
