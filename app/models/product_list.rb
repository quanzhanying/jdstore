class ProductList < ApplicationRecord
  belongs_to :order
  has_many :products, through: :cart_items, source: :product
end
