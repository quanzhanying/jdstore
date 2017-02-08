class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product
  def add_product_to_cart(product)
    c = cart_items.build
    c.product = product
    c.quantity = 1
    c.save
  end
end
