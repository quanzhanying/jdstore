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

  def remove_product(product)
    pos_to_deletes = []
    cart_items.each_with_index do |item , index|
        if item.product.id == product.id
            # pos_to_deletes.push(index)
            cart_items.delete(item)
        end
    end

  end

end
