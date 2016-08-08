class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product

  # validates :storage, numericality: {greater_than: 0} 好像不应该在这里加，因为cart不知道storage是什么东西，product知道。

  def add_product_to_cart(product)
    # is_include = false
    # if product.storage > 0 # 我要去看看哪里调用了add这个函数
    #
    #     if products.include?(product)
    #       #$check_exist_msg = "This item has existed in your cart!"
    #       is_include = true
    #     else
          ci = cart_items.build
          ci.product = product
          ci.quantity = 1
          ci.save
    #     end
    #
    #   # ci.quantity = 1
    #   # ci.save
    # else
    #   # redirect_to :back, alert: "没货了" #为什么会说我没有redirect方法
    #   # flash[:alert] = "No Storage!"
    #   # redirect_to root_path # 可能因为是在model里面，所以不知道rootpath么？
    #   # no_storage_alert
    #   # 必须要让这里经过一个controller
    #   $add_cart_msg = "No Storage!"
    # end
    #
    # is_include
  end

  def total_price
    sum = 0
    cart_items.each do |cici|
      sum += cici.quantity * cici.product.money
    end
    return sum
  end


end
