class Product < ApplicationRecord
  validates :title, :description, :price, :store, :width, :height, presence: true
  mount_uploader :attachment, AttachmentUploader
end
