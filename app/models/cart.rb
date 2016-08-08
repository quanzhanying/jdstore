class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products,through: :cart_items,source: :product

  def add_product_to_cart(product)
    cart_item = cart_items.build
    cart_item.product = product
    cart_item.quantity = 1
    cart_item.save
  end
end
