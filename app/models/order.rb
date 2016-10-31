# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  status              :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  delivery_address_id :integer
#  user_id             :integer
#

class Order < ApplicationRecord
	has_many :cart_items
	has_one :delivery_address
	belongs_to :user

	scope :not_deliveried, -> { where.not(status: "DELIVERED") }
end
