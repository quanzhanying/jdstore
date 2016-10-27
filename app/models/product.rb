class Product < ApplicationRecord
  validates :title,:description,:quantity,:price,presence:true
  mount_uploader :image,ImageUploader
has_many :photos

end
