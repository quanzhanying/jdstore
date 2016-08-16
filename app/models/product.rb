# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  quantity    :integer
#  price       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  attachment  :string
#  is_hidden   :boolean          default(TRUE)
#

class Product < ApplicationRecord
  validates :title, presence: true
  #has_many :cart_items
  mount_uploader :attachment, AttachmentUploader

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  def quantity_decrease(i)
    self.quantity = self.quantity - i
  end

  def quantity_increase(i)
    self.quantity = self.quantity + i
  end

end
