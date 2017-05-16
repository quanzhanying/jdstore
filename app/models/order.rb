class Order < ApplicationRecord
  belongs_to user

  validates :billing_name, presence: ture
  validates :billing_address, presence: ture
  validates :shipping_name, presence: ture
  validates :shipping_address, presence: ture
  
end
