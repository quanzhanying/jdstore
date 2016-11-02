class Order < ApplicationRecord
  before_create :generate_token
  def generate_token
    self.token = SecureRandom.uuid
  end
  belongs_to :user
  has_many :product_lists
  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true
  def pay_with_alipay!
    self.is_paid = true
    self.payment_method = "alipay"
    self.save
  end

  def pay_with_wechat!
    self.is_paid = true
    self.payment_method = "wechat"
    self.save
  end  
end
