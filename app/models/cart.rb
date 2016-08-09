class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product

  def add_product_to_cart(product)
    c1 = cart_items.build
    c1.product = product
    c1.quantity = 1
    c1.save
  end

  def total_price
   sum = 0
   cart_items.each do |cart_item|
     sum += cart_item.quantity * cart_item.product.price
   end
   sum
 end

end
