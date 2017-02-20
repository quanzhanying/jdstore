class Product < ApplicationRecord
  belongs_to :category
  has_many :photos
  accepts_nested_attributes_for :photos

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :size, presence: true

  scope :recent, -> { order("created_at DESC") }
  has_many :reviews, dependent: :destroy
  has_many :favorites
  has_many :fans, :through => :favorites, :source => :user

end
