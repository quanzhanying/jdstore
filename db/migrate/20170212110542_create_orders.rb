class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
t.integer :total, default: 0
t.intrger :user_id
t.integer :billing_name
t.integer :billing_address
t.integer :shipping_name
t.integer :shipp_address 
      t.timestamps
    end
  end
end
