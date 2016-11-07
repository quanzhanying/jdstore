# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  price        :integer
#  storage      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  is_available :boolean          default(FALSE)
#  attachment   :string
#

class Item < ApplicationRecord

  validates :title, presence: true
  has_many :cart_item
   
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
