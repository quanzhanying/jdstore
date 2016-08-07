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
  has_many :products, :through => :cart_items, :source => :product

  def add_product_to_cart(product)
    puts "+++++#{cart_items}"
    ci = cart_items.build
    puts "#{ci}+++++#{cart_items}"
    ci.product = product
    ci.quantity = 1
    ci.save
  end

end
