class Category < ApplicationRecord
  has_many :exams
  validates :name, presence: true

end
