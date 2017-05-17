class Order < ApplicationRecord
  before_create :generate_token

  belongs_to :user
  has_many :product_lists

  validates :shipping_name, presence: true
  validates :shipping_number, presence: true
  validates :shipping_address, presence: true

  def generate_token
    self.token = SecureRandom.uuid
  end

  def set_payment_with!(method)
    self.payment_method = method
    self.save
  end

  def pay!
    self.is_paid = true
    self.save
  end

end
