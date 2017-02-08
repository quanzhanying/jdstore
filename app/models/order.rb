class Order < ApplicationRecord
belongs_to :user
has_many :product_lists
validates :billing_name, presence:{message: "请填写购买人姓名"}
validates :billing_address, presence: {message: "请填写购买人地址"}
 validates :shipping_name, presence: {message: "请填写收件人姓名"}
 validates :shipping_address, presence: {message: "请填写收件人地址"}
end
