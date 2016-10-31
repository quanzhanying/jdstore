class CartItem < ApplicationRecord
  validates :cart_id, uniqueness: {scope: :product_id, message: "dont"}

  def meg
    flash[:alert] = '玩蛋儿去'
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
