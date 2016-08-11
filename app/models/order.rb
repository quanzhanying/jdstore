class Order < ApplicationRecord
  before_create :generate_token

  belongs_to :user
  validates :billing_name,presence: true
  validates :billing_address,presence:true
  validates :shipping_name,presence:true
  validates :shipping_address,presence:true

  has_many :product_lists

  def generate_token
    self.token = SecureRandom.uuid
  end

  def pay_status
    if self.is_paid
      "已支付"
    else
      "未支付"
    end
  end

  def updated_at_formate
    self.updated_at.strftime("%Y-%m-%d %H:%M:%S")
  end

end
