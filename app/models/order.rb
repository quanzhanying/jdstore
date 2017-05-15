class Order < ApplicationRecord
  before_create :generate_token

  belongs_to :user
  has_many :product_lists

  validates :shipping_name, presence: true
  validates :shipping_number, presence: true
  validates :shipping_address, presence: true
  validates :shipping_by, presence: true
  validates :paid_by, presence: true

  def generate_token
    self.token = SecureRandom.uuid
  end

end
