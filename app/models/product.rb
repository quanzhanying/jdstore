# -*- encoding : utf-8 -*-
class Product < ApplicationRecord
    mount_uploader :image, ImageUploader
end
