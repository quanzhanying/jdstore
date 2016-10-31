class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :product
mount_uploader :attachment,AttachmentUploader   
end
