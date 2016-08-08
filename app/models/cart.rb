class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product

  def add_product_to_cart(product)
    if products.include?(product)
      ci = cart_items.find_by(product_id: product)
      ci.quantity += 1
    else
      ci = cart_items.build
      ci.product = product
      ci.quantity =1
    end
    ci.save
  end

  def total_price
    sum = 0
    cart_items.each do |cart_item|
      sum += cart_item.quantity * cart_item.product.price
    end
    sum
  end
end
