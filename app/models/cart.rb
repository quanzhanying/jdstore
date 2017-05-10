class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products , through: :cart_items, source: :product

  def add_product_to_cart(product)
      ci = cart_items.build
      ci.product = product
      ci.quantity = 1
      ci.save
  end

  def cart_total_price
      sum = 0
      cart_items.each do |cart_item|
      if cart_item.product.price.present?
          sum = sum + cart_item.quantity * cart_item.product.price
        end
      end
      return sum
  end

  def clear_cart
    cart_items.clear
  end

end
