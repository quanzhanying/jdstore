class Order < ApplicationRecord
	belongs_to :user
	validates :billing_name, presence: true
	validates :billing_address, presence: true
	validates :shipping_name, presence: true
	validates :shipp_address, presence: true
end
