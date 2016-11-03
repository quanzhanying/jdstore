# == Schema Information
#
# Table name: product_lists
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  price      :float
#  order_id   :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductList < ApplicationRecord

	belongs_to :order

	# scope :product, -> {Product.find(product_id)}
end
