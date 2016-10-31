class Cart < ApplicationRecord

  has_many :cart_items
  has_many :products, through: :cart_items, source: :product

  def add_product_to_cart(product)
    ci = cart_items.build
    ci.product = product
    ci.quantity = 1
    ci.save
  end
end

# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  cart_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
