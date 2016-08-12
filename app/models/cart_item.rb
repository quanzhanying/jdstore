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
  validates :quantity, :numericality => {:greater_than_or_equal_to => 0}
  belongs_to :cart
  belongs_to :product

  def number_up!
    self.quantity += 1
    self.save
  end

  def number_down!
    self.quantity -= 1
    self.save
  end
end
