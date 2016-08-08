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
    if products.include?(product)
      ci = cart_items.find_by(product_id: product)
      ci.quantity += 1
    else
      ci = cart_items.build
      ci.product = product
      ci.quantity = 1
    end
    ci.save
  end

  def del_cart_items(ids)
    # puts "+++++#{ids}"
    # cart_items = CartItem.find_by_sql("select * from cart_items where cart_id = #{self.id} and id in (#{ids})").delete_all
    CartItem.find_by_sql("delete from cart_items where cart_id = #{self.id} and id in (#{ids})")
    # cart_items.find_by(id: "#{ids}")
  end

  def total_price
    sum = 0
    cart_items.each do |cart_item|
      sum += cart_item.quantity * cart_item.product.price
    end

    sum
  end

end
