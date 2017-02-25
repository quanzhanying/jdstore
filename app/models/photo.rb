class Photo < ApplicationRecord
  belongs_to :chef
  mount_uploader :image, ImageUploader
end
