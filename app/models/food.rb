class Food < ApplicationRecord
  mount_uploader :image, ImageUploader
end
