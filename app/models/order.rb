class Order < ApplicationRecord

  # ---订单乱序token号---
  before_create :generate_token           # before_create 是rails model內建的callbacks（回调函数），目的是让资料储存前先执行某动作。

  def generate_token
    self.token = SecureRandom.uuid        # SecureRandom.uuid 是Ruby內建的随机生成器
  end


  # ---付款方式---

  def set_payment_with!(method)                           # 记录付款方式
    self.update_columns(payment_method: method)
  end

  def pay!                                                # 记录已完成付款
    self.update_columns(is_paid: true)
  end


  # ---model关系---

  belongs_to :user
  has_many :product_lists


  # ---订单的信息填写不能为空---

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true



end
