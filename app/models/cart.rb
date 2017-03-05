class Cart < ApplicationRecord
  has_many :cart_items
  has_many :cart_template_items
  has_many :products, through: :cart_items, source: :product
  has_many :templates, through: :cart_template_items, source: :template

  def add_product_to_cart(product)
    ci = cart_items.build
    ci.product = product
    ci.quantity = 1
    ci.save
  end

  def add_template_to_cart(template)
    ci = cart_template_items.build
    ci.template = template
    ci.save
  end

  def total_price
    sum = 0
    cart_items.each do |cart_item|
      if cart_item.product.price.present?
        sum +=  cart_item.quantity * cart_item.product.price
      end
    end
    cart_template_items.each do |cart_template_item|
      if cart_template_item.template.price.present?
        sum +=  cart_template_item.template.price
      end
    end
    sum
  end

  def clean!
    cart_items.destroy_all
    cart_template_items.destroy_all
  end

end
