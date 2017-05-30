class Order < ApplicationRecord
  belongs_to :user

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shiping_name, presence: true
  validates :shiping_address, presence: true
end
