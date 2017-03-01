#class Photo < ApplicationRecord
#end

class Photo < ActiveRecord::Base
   mount_uploader :avatar, AvatarUploader
   belongs_to :product
end
