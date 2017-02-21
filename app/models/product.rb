class Product < ApplicationRecord
    mount_uploader :image, ImageUploader
end

def self.serch(search)
    where('name LIKE ?', "%#{search}%")
end
