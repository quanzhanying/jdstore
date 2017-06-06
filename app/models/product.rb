class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_list
  is_impressionable

end
