class Product < ApplicationRecord
   mount_uploader :image, ImageUPloader
end
