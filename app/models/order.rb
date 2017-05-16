class Order < ApplicationRecord
  belongs_to :user

  validateds :billing_name, presence: true
  validateds :billing_address, presence: true
  validateds :shipping_name, presence: true
  validateds :shipping_address, presence:true
  
end
