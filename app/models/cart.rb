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
      if cart_item.product.price.present?
        # sum = sum + cart_item.quantity * cart_item.product.price + cart_item.product.salt + cart_item.product.sugar + cart_item.product.papper + cart_item.product.sauces + cart_item.product.vinegar + cart_item.product.oil 
         sum = sum + cart_item.quantity * cart_item.product.price + cart_item.product.salt * 0.1 + cart_item.product.sugar * 0.2 + cart_item.product.papper * 0.2 + cart_item.product.sauces * 0.1 + cart_item.product.vinegar * 0.1 + cart_item.product.oil * 0.1

      end
    end
    sum
  end

  def clean!
    cart_items.destroy_all
  end
end
