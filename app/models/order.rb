class Order < ApplicationRecord
  belongs_to :user

  validatables :billing_name, presence: true
  validatables :billing_address, presence: true
  validatables :shipping_name, presence: true
  validatables :shipping_address, presence: true
end
