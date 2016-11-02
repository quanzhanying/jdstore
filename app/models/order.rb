class Order < ApplicationRecord
  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end

  def set_payment_with!(method)
    self.update_columns(payment_method: method)
  end

  def status
    s = "未支付"
    if is_paid == true
      s = "已支付"
    end
    s
  end

  def pay!
      self.update_columns(is_paid: true)
  end

  validates :bill_name, presence: true
  validates :bill_address, presence: true
  validates :ship_name, presence: true
  validates :ship_address, presence: true

  belongs_to :user
  has_many :product_lists

end
