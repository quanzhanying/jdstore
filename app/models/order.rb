# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  total            :float            default(0.0)
#  user_id          :integer
#  billing_name     :string
#  billing_address  :string
#  shipping_name    :string
#  shipping_address :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  token            :string
#  payment_method   :string
#  aasm_state       :string           default("order_created")
#  order_state      :string           default("等待付款")
#

class Order < ApplicationRecord
  include AASM

  belongs_to :user
  has_many :item_lists, dependent: :destroy

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true


  aasm do
    state :order_created, initial: true
    state :paid
    state :refunding
    state :shipping
    state :order_cancelled
    state :good_returning
    state :order_placed

    event :make_payment do
      transitions from: :order_created, to: :paid, after: lambda{ set_order_state("买家已付款") }
    end

    event :request_a_refund do
      transitions from: :paid, to: :refunding, after: lambda{ set_order_state("退款中") }
    end

    event :ship do 
      transitions from: :paid, to: :shipping, after: lambda{ set_order_state("卖家已发货") }
    end

    event :request_a_return do
      transitions from: :shipping, to: :good_returning, after: lambda{ set_order_state("退货中") }
    end

    event :received do
      transitions from: :shipping, to: :order_placed, after: lambda{ set_order_state("交易成功") }
    end

    event :cancel_order do
      transitions from: [:order_created, :good_returning, :refunding], to: :order_cancelled, after: lambda{ set_order_state("交易关闭") }
    end

  end


  def generate_token
    self.token = SecureRandom.uuid
  end

  def pay(pay_way)
    self.payment_method = pay_way
    self.make_payment!

    self.save
    order_submitted_notification
  end

private

  def set_order_state(state)
    self.order_state = state
  end

  def order_submitted_notification
    JdstoreMailer.order_notification(self).deliver!
  end

end
