class Order < ApplicationRecord
  belongs_to :user

  validates :billing_name, presence: true
  validates :billing_adress, presence: true
  validates :shipping_name, presence: true
  validates :shipping_adress, presence: true

end
