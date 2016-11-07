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
#  is_hidden   :boolean          default(TRUE)
#

class Product < ApplicationRecord
  mount_uploader :image,ImageUploader

  def publish!
    self.is_hidden=false
    self.save
  end

  def hide!
    self.is_hidden=true
    self.save
  end
end
