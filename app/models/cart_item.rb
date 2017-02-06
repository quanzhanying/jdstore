class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def add_product_to_cart(product)
    ci = cart_items.build
    ci.product = product
    ci.quantity = 1
    ci.save
  end
end
