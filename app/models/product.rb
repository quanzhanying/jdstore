class Product < ApplicationRecord
  validates :title, :description, :price, :store, presence: true
  mount_uploader :attachment, AttachmentUploader
end
