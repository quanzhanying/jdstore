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
                sum += cart_item.quantity * cart_item.product.price
            end
        end
        sum
    end

    def clear_all_cart_items
        # ===method 1
        cart_items.destroy_all
        # ===method 2
        # cart_items.each do |cart_item|
        #     cart_item.delete
        # end
    end
end
