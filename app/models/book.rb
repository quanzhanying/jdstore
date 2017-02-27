class Book < ApplicationRecord
  mount_uploader :image, ImageUploader
end
