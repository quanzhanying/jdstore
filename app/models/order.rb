class Order < ApplicationRecord
  validates :billing_name , presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true
  belongs_to :user
  has_many :product_lists

  before_create :generate_token

  include AASM

  aasm do
    state :order_placed, initial:true
    state :paid
    state :shipping
    state :shipped
    state :order_cancelled
    state :good_returned

    event :make_payment, after_commit: :pay! do
      transitions from: :order_placed, to: :paid
    end

    event :ship do
      transitions from: :paid, to: :shipping
    end

    event :deliver do
      transitions from: :shipping , to: :shipped
    end

    event :return_good do
      transitions from: :shipped, to: :good_returned
    end

    event :cancel_order do
      transitions from: [:order_placed, :paid], to: :order_cancelled
    end

  end

  def generate_token
      self.token = SecureRandom.uuid
  end

  def set_pay_method!(method)
    self.update_columns(payment_method: method)
  end

  def pay!
    self.update_columns(is_paid: true)
  end

  def pay_state_info
    if self.aasm_state == "order_cancelled"
      "订单已取消"
    elsif self.aasm_state == "paid"
      "已支付"
    elsif self.aasm_state == "shipping"
      "出货中"
    elsif self.aasm_state == "shipped"
      "到货"
    elsif self.aasm_state == "good_returned"
      "退货"
    elsif self.aasm_state == "order_placed"
      "未支付"
    else
      "未知"
    end
  end

  def can_pay?
    if self.aasm_state == "order_placed"
      return true
    else
      return false
    end
  end

  def can_cancel?
    if self.aasm_state == "order_placed" || self.aasm_state == "paid"
      return true
    else
      return false
    end
  end

  def can_ship?
    if self.aasm_state == "paid"
      return true
    else
      return false
    end
  end
end
