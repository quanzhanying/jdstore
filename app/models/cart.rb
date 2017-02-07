class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product
end
