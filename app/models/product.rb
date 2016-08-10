class Product < ApplicationRecord
  validates :title, :description, :price, :store, :width, :height, presence: true
  validates   :store, numericality: { greater_than: -1}
  mount_uploader :attachment, AttachmentUploader
end
