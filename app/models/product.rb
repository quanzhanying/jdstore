#class Product < ApplicationRecord
  #mount_uploader :image, ImageUploader
#end

class Product < ActiveRecord::Base
   has_many :photos
   accepts_nested_attributes_for :photos
end
