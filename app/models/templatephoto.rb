class Templatephoto < ApplicationRecord
  belongs_to :template

  mount_uploader :image, ImageUploader
end
