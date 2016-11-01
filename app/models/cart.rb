class Cart < ApplicationRecord

  has_many :cart_items
  has_many :products, through: :cart_items, source: :product

  # 在购物车中修改cart_item数据,如果产品id重复则只是其值+1
  def add_product_to_cart(product)
    # puts '~~~'
    # puts product
    # puts '~~~'
    # p = Product.find(product.id)
    # if cart_items.where(product_id: p.id)
    #   puts 'haha'
    # else
    #   puts 'ohno'
    # end
    # # p.quantity = p.quantity + 1
    # # puts p.quantity
    # puts '~~~'

    ci = cart_items.build
    ci.product = product
    ci.quantity = 1
    ci.save
  end

  # 计算购物车内价格总和
  def total_price
    sum = 0
    cart_items.each do |cart_item|
      sum = sum + cart_item.quantity * cart_item.product.price 
    end
    return sum
  end

end

# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#






