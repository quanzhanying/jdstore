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

  def add(product, quantity)
    # 商品已经在购物车中，增加商品的数量
    if products.include?(product)
      cart_item = cart_items.find_by_product_id(product.id)
    else
      cart_item = cart_items.build
    end
    cart_item.product = product

    if quantity > 0
      cart_item.quantity = quantity
    else
      cart_item.quantity = 1
    end
    cart_item.save
  end

  def total_price
    sum = 0
    cart_items.each do |cart_item|
      if cart_item.product.price.present?
        sum += cart_item.quantity * cart_item.product.price
      end
    end
    sum
  end

  def clean!
    cart_items.destroy_all
  end

end
