# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  total            :integer          default(0)
#  user_id          :integer
#  billing_name     :string
#  billing_address  :string
#  shipping_name    :string
#  shipping_address :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  token            :string
#  is_paid          :boolean          default(FALSE)
#  payment_method   :string
#

class Order < ApplicationRecord
  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true
  belongs_to :user
  has_many :product_lists

  before_create :generate_token

  def set_payment_with!(method)
    self.update_columns(payment_method: method) #self 是什么鬼？更新columns
  end

  def pay!
    self.update_columns(is_paid: true )
  end

  def generate_token
    self.token = SecureRandom.uuid
  end

  include AASM #不知道是什么鬼
  aasm do
    state :order_placed, initial: true #order_paced 可以在schema找到，默认值／初始值，自定义命名。
    state :paid
    state :shipping
    state :shipped
    state :order_cancelled
    state :good_returned

    event :make_payment, after_commit: :pay! do #为什么要加after_commit: :pay! ?
      transitions from: :order_placed, to: :paid
    end

    event :ship do
      transitions form: :paid, to: :shipping
    end

    event :deliver do
      transitions form: :shipping, to: :shipped
    end

    event :return_good do
      transitions from: :shipped, to: :good_returend
    end

    event :cancell_order do
      transitions form: [:order_placed, :paid], to: :order_cancelled
    end #这一句不知为什么加[:order_placed, :paid]？
  end
end
