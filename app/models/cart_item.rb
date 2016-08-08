# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#  cart_id    :integer
#

class CartItem < ApplicationRecord
  belongs_to :product
  validates :quantity, presence: true, numericality: {greater_than: 0}


  def up_count!
    product = self.product.quantity
    if self.quantity < product
      self.quantity += 1
      self.save
    end
  end

  def down_count!
    if self.quantity >= 2
      self.quantity -= 1
      self.save
    end
  end

  def edit_cart_item_count!(quantity)
    product = self.product.quantity
    if !product.blank? && !quantity.blank? && quantity.to_i > 0 && quantity.to_i < product
      self.quantity = quantity
      if self.save()
        true
      else
        false
      end
    else
      false
    end
  end
end
