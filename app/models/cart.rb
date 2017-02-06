class Cart < ApplicationRecord
    has_many ；cart_iterms
    has_many :products, through: :cart_iterms, source: :product

    def add_product_to_cart(product)
        ci = cart_iterms.build
        ci.product = product
        ci.quantity = 1
        ci.save
    end
end
