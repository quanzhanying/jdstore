class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validates :quantity, presence: true
  validates :quantity, numericality: {greater_than: 0}

  # validates :storage, numericality: {greater_than: 0} # 根据报错信息，好像应该加到add_to_cart方法里
end
