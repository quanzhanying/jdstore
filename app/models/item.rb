class Item < ApplicationRecord



  mount_uploader :attachment, AttachmentUploader

    def hide!
      self.is_available = false
      self.save
    end

    def publish!
      self.is_available = true
      self.save
    end



end
