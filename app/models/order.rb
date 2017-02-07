class Order < ApplicationRecord
  belongs_to :user
  validates :billing_name, presence: true
  vaildates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true
end
