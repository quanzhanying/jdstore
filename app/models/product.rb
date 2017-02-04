class Product < ApplicationRecord::Base
  mount_uploader :image, Imageuploader
end
