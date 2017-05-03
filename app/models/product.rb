class Product < ApplicationRecord
    mount_uploader :image, ImageUploader

    def self.search(search)
      where("description LIKE ? OR title LIKE ?", "%#{search}%", "%#{search}%")
    end
end
