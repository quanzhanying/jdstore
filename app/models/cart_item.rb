class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product


  def upup!
    self.quantity += 1
    self.save
  end

  def downdown!
    self.quantity -= 1
    self.save
  end
end
