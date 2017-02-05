module NopicHelper
    def no_pic?(product)
        product.image.length == 0
    end
end