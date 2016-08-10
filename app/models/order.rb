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
#  is_paid          :boolean          default(FALSE)
#  payment_method   :string
#

class Order < ApplicationRecord

  belongs_to :user
  has_many :item_lists, dependent: :destroy

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  def generate_token
    self.token = SecureRandom.uuid
  end

  def pay(pay_way)
    self.payment_method = pay_way
    self.is_paid = true

    self.save
    order_submitted_notification
  end

private

  def order_submitted_notification
    JdstoreMailer.order_notification(self).deliver!
  end

end
