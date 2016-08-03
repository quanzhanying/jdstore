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
#

class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, file_size: { less_than_or_equal_to: 6.megabyte },
                             file_content_type: { allow: ['image/jpeg', 'image/png'] }

  validates :title, presence: true
  validates :description, presence: true
  validates :quantity, numericality: { greater_than: 0 }
  validates :price, numericality: true
end
