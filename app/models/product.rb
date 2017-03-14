# class Product < ApplicationRecord
class Product < ActiveRecord::Base
   mount_uploader :image, ImageUploader
end
