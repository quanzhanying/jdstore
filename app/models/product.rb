

class Product < ActiveRecord::Base

   has_many :photos
   accepts_nested_attributes_for :photos
end

#class Product < ApplicationRecord
#  mount_uploader :image, ImageUploader

#    def self.search(search)
#      where("title LIKE ?", "%#{search}%").or(where("description LIKE ?", "%#{search}%")).or(where("kind LIKE ?", "%#{search}%"))
#   end

#end
