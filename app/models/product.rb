class Product < ApplicationRecord
  validates :title,presence:true
  belongs_to :users
end
