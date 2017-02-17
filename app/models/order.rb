class Order < ApplicationRecord
  belongs_to :user

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :billing_name, presence: true
  validates :billing_address, presence: true
  
end
