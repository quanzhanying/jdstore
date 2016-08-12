class CartItem < ApplicationRecord
  validates_uniqueness_of :product_id, :scope => :cart_id
  
  belongs_to :cart
  belongs_to :product
end
