class Cart < ApplicationRecord
  has_many :cart_items
  has_many :items, through: :cart_items, source: :item

  def add_item_to_cart(item)
    ci = cart_items.build
    ci.item = item
    ci.storage = 1
    ci.save
  end


  def total_price
    sum = 0
    cart_items.each do |cart_item|
      sum = sum + cart_item.storage * cart_item.item.price
    end
    sum
  end
end
