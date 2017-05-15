class Order < ApplicationRecord
  belongs_to :user

  validates :shipping_name, presence: true
  validates :shipping_number, presence: true
  validates :shipping_address, presence: true
  validates :shipping_by, presence: true
  validates :paid_by, presence: true
end
