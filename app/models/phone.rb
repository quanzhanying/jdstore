class Phone < ApplicationRecord
  mount_uploader :image, ImageUploader
end
