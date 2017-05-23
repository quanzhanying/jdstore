class Exam < ApplicationRecord
  belongs_to :category
  belongs_to :size
  has_many :photos
  accepts_nested_attributes_for :photos

  validates :question, presence: true
  validates :answer_1, presence: true
  validates :answer_2, presence: true



end
