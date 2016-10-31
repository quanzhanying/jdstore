# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  status              :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  delivery_address_id :integer
#  user_id             :integer
#  aasm_state          :string
#

class Order < ApplicationRecord
  include AASM

  aasm do
  	state :order_placed, initial: true #狀態：已下訂

    state :paid                        #狀態：已付款

    state :shipping                    #狀態：出貨中

    state :shipped                     #狀態：到貨

    state :order_cancelled             #狀態：取消訂單

    state :good_returned               #狀態：退貨


    event :make_payment do             #已下訂→付款後→轉成已付款
      transitions from: :order_placed, to: :paid
    end

    event :ship do                     #已付款→出貨→轉成出貨中
      transitions from: :paid,         to: :shipping
    end
    event :deliver do                  #出貨中→運送中→轉成已到貨

      transitions from: :shipping,     to: :shipped
    end

    event :return_good do              #已到貨→欲退貨→完成退貨
      transitions from: :shipped,      to: :good_returned
    end

    event :cancell_order do            #已下訂→欲取消訂單→完成取消訂單            
      transitions from: [:order_placed, :paid], to: :order_cancelled
    end
    
  end
	has_many :cart_items
	has_one :delivery_address
	belongs_to :user

	scope :not_deliveried, -> { where.not(status: "DELIVERED") }
end
