class CartItem < ApplicationRecord
  belongs_to :cart
  belogns_to :product
end
