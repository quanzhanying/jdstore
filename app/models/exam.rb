class Exam < ApplicationRecord

  has_many :photos
  accepts_nested_attributes_for :photos

  validates :question, presence: true
  validates :answer_1, presence: true
  validates :answer_1, presence: true




end
