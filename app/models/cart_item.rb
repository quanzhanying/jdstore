class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  # def increase
  #   self.quantity += 1
  #   self.save
  # end
  #
  # def decrease
  #   self.quantity -= 1
  #   self.save
  # end


end
