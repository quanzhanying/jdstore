class Order < ApplicationRecord
  t.integer :total, default: 0
  t.integer :user_id
  t.string :billing_name
  t.string :billing_address
  t.string :shipping_name
  t.string :shipping_address
end
