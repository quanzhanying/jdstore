class Order < ApplicationRecord
  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end
  
  belongs_to :user

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shiping_name, presence: true
  validates :shiping_address, presence: true
  has_many :product_lists
end
