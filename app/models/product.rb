# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  is_publish  :boolean          default(FALSE)
#

class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, file_size: { less_than_or_equal_to: 6.megabyte },
                             file_content_type: { allow: ['image/jpeg', 'image/png'] }

  validates :title, presence: true
  validates :description, presence: true
  validates :quantity, numericality:true
  validates :price, numericality: true

  has_many :product_relations
  has_many :members, through: :product_relations, source: :user

  scope :is_publish, -> {where is_publish: true}

  def publish!
    if !self.is_publish
      self.is_publish = true
      self.save
    end
  end

  def hide!
    if self.is_publish
      self.is_publish = false
      self.save
    end
  end
end
