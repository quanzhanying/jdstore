class Image < ApplicationRecord
   belongs_to :user
   belongs_to :product

 # mount_uploader :attachment, AttachmentUploader

   validates :content, presence:true
end
