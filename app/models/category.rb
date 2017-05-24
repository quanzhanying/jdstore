class Category < ApplicationRecord
  has_many :exam
  validates :name, presence: true

end
