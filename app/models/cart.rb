class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product

  def add_product_to_cart(product)
    ci = cart_items.build
    ci.product = product
    ci.quanlity = 1
    ci.save
  end
end
