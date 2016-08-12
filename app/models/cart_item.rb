class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def updated_at_formate
    self.updated_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end
