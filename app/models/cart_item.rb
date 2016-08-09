class CartItem < ApplicationRecord
  belongs_to :cart_items
  belongs_to :product
end
