module NopicHelper
    def no_pic?(product)
        # product.image.length == 0
        product.image.blank?
    end
end