class Order < ApplicationRecord

  validates :billing_name, :billing_address, :shipping_name, :shipping_address, presence: true

  belongs_to :user
  has_many :product_lists

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end
end
