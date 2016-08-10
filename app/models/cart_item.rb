class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validates   :quantity, numericality: { greater_than: -1}
end
