class Product < ApplicationRecord
  belongs_to :user

  validates :description ,presence: true


    #mount_uploader :image, AaamageUploader
end
