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


  def add_product_to_cart
    ci = cart_items.build
    ci.product = product
    ci.quantity =  1
    ci.save
  end

end
