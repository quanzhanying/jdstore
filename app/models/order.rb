class Order < ApplicationRecord
  belongs_to :user
  has_mamny :product_lists

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

end
