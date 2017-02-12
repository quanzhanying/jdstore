class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, though: :cart_items, sources: :product

  def add_product_cart(product)
    ci = cart_items.build
    ci.product = product
    ci.quantity = 1
    ci.save
  end

end
