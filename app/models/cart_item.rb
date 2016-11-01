class CartItem < ApplicationRecord

  belongs_to :cart
  belongs_to :product

  def num_increase
    # self.quantity += 1
    # self.save
    # 放置一个可以添加数量的上限
    if self.quantity >= self.product.quantity
      return false
      # 前台做提示
    else
      self.quantity += 1
      self.save
      return true
    end
    # puts '~~'
    # puts cart_item.quantity
    # quantity = quantity+1
    # puts '~~'
    # quantity = quantity + 1
  end

  def num_decrease
    if self.quantity <= 0
      return false
    else
      self.quantity -= 1
      self.save
      return true
    end
  end

end

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
