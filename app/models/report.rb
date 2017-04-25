class Report < ApplicationRecord
  belongs_to :user
  belongs_to :post

  mount_uploader :attachment, AttachmentUploader
  
  validates :content, presence: true
end
