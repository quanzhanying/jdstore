class Order < ApplicationRecord
  belongs_to :user

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shopping_name, presence: true
  validates :shopping_address, presence: true

end
