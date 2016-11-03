# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product


  def add_product_to_cart(product)
    ci = cart_items.build
    ci.product = product
    ci.quantity = 1
    ci.save
  end

  def total_price
    sum = 0
    cart_items.each do |cart_item|
      sum += cart_item.quantity * cart_item.product.price
    end
    sum
  end


end
