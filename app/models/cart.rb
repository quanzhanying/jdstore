class Cart < ApplicationRecord
  has_many :products, through: :cart_items, source: :product
  has_many :cart_items
  #validates :product, uniqueness: true
  def add_product_to_cart(product)
    # c = cart_items.build
    # c.product = product
    # c.quantity = 1
    # c.save
    if cart_item = self.cart_items.find_by_product_id(product.id)
      cart_item.quantity += 1
      cart_item.save
      cart_item
    else
      self.cart_items.create(:product_id => product.id,:quantity =>1)
    end
  end

  def total_price
    sum = 0
    cart_items.each do |cart_item|
      sum += cart_item.quantity * cart_item.product.price
    end
    sum
  end


end
