class CartItem < ApplicationRecord

  belongs_to :cart
  belongs_to :product

  def add!
    sum = 1
    sum += cart_item.quantity + 1
    sum
  end

end
