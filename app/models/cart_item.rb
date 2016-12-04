# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  product_id :integer
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  # attr_reader :product,:quantity
  # def initialize
  #   @product = product
  #   @quantity = 1
  # end
  def increment_quantity!
    # if self.quantity < product.quantity
    self.quantity += 1
    # else

    self.save
    # end
  end
  def decrement_quantity!
    self.quantity -= 1
    self.save
  end

  def title
    @product.title
  end
  def price
    @product.price * @quantity
  end
end
