class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product

  def add_product_to_cart(product)
    ci = cart_items.build
    # 功能上等于new,更安全的写法。
    ci.product = product
    ci.quantity = 1
    ci.save
  end

  def total_price
    sum = 0
    cart_items.each do |cart_item|
      if cart_item.product.price.present?
        sum = sum + cart_item.quantity * cart_item.product.price
      end
    end
    sum
  end

  def clean!
    cart_items.destroy_all
  end
end
