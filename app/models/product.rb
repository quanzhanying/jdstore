class Product < ApplicationRecord
    mount_uploader :image, ImageUploader

    has_many :cart_items
end
