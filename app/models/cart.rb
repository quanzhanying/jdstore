class Cart < ApplicationRecord
  has_many :cart_items
  has_many :product, through: :cart_items, source: :product

  def add_product_to_cart(prodct)
    ci = cart-items.build
    ci.product = product
    ci.quantity = 1
    ci.save

  end
end
