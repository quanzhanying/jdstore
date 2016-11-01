class CartItem < ApplicationRecord
  validates :cart_id, uniqueness: {scope: :product_id, message: "dont"}

  def meg
    flash[:alert] = '玩蛋儿去'
  end

  def plus_button
    if self.quantity < self.product.quantity
      self.quantity += 1
      self.save
    else
      flash[:alert] = '已超出库存'
    end
  end

  def reduce_button
    self.quantity -= 1
    self.save
  end

  belongs_to :product
  belongs_to :cart
end

# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  product_id :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
