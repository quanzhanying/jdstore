class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product

  def add_product_to_cart(product)
    product_found = false

    cart_items.each do |cart_item|
      if cart_item.product == product
        product_found = true
        cart_item.quantity = cart_item.quantity + 1
        cart_item.save
      end
    end

    if !product_found
      ci =  cart_item.build
      ci.product = product
      ci.quantity = 1
      ci.save
    end
  end

  def total_price
    sum = 0
    cart_items.each do |cart_item|
      if cart_item.product.price.present?
        sum = sum + cart_item.product.price * cart_item.quantity
      end
    end
    sum
  end

  def remove_product_from_cart(product)
    cart_items.each do |cart_item|
      if cart_item.product == product
        cart_item.destroy
      end
    end

  end

end
