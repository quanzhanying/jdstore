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
#  is_hidden   :boolean          default(FALSE)
#

class Product < ApplicationRecord
    
    mount_uploader :image,  ImageUploader
    validates :title,:quantity,:price,presence: true
end
