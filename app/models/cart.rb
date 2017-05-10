# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product

  # 加入购物车
  def add_product_to_cart(product)
    ci = cart_items.build
    ci.product = product
    ci.quantity = 1
    ci.save
  end

  # 计算总价
  def total_price
    sum = 0
    cart_items.each do |cart_item|
      if cart_item.product.price.present?
        sum += cart_item.quantity * cart_item.product.price
      end
    end
    sum
  end

  #清空购物车
  def clean!
    cart_items.destroy_all
  end


end
