class Order < ApplicationRecord

  validates :billing_name, :billing_address, :shipping_name, :shipping_address, presence: true

  belongs_to :user
  has_many :product_lists
end
