class CartItem < ApplicationRecord
  belongs_to :Cart
  belongs_to :product
end
