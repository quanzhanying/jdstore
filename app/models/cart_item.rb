class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :product_id, uniqueness: { scope: :cart_id, message: "You Can not be added repeatedly"}
end
