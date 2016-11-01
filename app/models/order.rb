
class Order < ApplicationRecord

  before_create :generate_token

  belongs_to :user
  has_many :item_lists

  # validates :billing_name, presence: true
  # validates :billing_address, presence: true
  # validates :shipping_name, presence: true
  # validates :shipping_address, presence: true

  def generate_token
    self.token = SecureRandom.uuid
  end


  def wechat!
    self.is_paid = true
    self.payment_method = "Wechat"
    self.save
  end


  def alipay!
    self.is_paid = true
    self.payment_method = "Alipay"
    self.save
  end

end
