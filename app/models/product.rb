class Product < ApplicationRecord
  belongs_to :user, :foreign_key => "admin_id"

  validates :description ,presence: true


  mount_uploader :image, ImageUploader
end
