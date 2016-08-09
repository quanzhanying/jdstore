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
  validates :quantity, numericality: true
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
