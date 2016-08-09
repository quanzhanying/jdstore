class Product < ApplicationRecord
  validates :title, presence: true

  mount_uploader :attachment, AttachmentUploader

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
