class Cart < ApplicationRecord

  has_many :cart_items
  has_many :products, through: :cart_items, source: :product

  def add_product_to_cart(product)
    ci = cart_items.build
    ci.product = product
    ci.quantity = 1
    ci.save
  end


  def total_price
    sum = 0
    cart_items.each do |cart_item|
      sum += cart_item.quantity * cart_item.product.price
    end
    sum
  end

  def add_cart_item(product_id)
    cart_item = cart_items.find_or_create_by_product_id(product_id)
    cart_item.quantity += 1
    cart_item.save
  end


end
