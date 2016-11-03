class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end
  # def increase
  #   self.quantity += 1
  #   self.save
  # end
  #
  # def decrease
  #   self.quantity -= 1
  #   self.save
  # end
