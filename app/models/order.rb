class Order < ApplicationRecord
  belongs_to :user
  before_create :generate_token

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  has_many :product_lists

  def generate_token
    self.token = SecureRandom.uuid
  end
end
