class Order < ApplicationRecord

  before_create :generate_token

  belongs_to :user
  has_many :product_lists

  def generate_token
    self.token = SecureRandom.uuid
  end

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  scope :recent, -> { order("created_at DESC")}
end
