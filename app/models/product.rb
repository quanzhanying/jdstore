class Product < ApplicationRecord
  validates :title,presence:true
  validates :description,presence:true
  validates :quantity,presence:true
  validates :price,presence:true

  mount_uploader :image,ImageUploader
has_many :photos

end
