class Order < ApplicationRecord

  # 订单乱序token号
  before_create :generate_token           # before_create 是rails model內建的callbacks（回调函数），目的是让资料储存前先执行某动作。

  def generate_token
    self.token = SecureRandom.uuid        # SecureRandom.uuid 是Ruby內建的随机生成器
  end

  # ------

  belongs_to :user
  has_many :product_lists

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true



end
