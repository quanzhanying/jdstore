class Cart < ApplicationRecord
  has_many :products, through: :cart_items, source: :product
  has_many :cart_items
  #validates :product, uniqueness: true
  def add_product_to_cart(product)
    c = cart_items.build
    c.product = product
    c.quantity = 1
    c.save
  end

  def total_price
    sum = 0
    cart_items.each do |cart_item|
      sum += cart_item.quantity * cart_item.product.price
    end
    sum
  end


end
