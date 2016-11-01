class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :total,default:0
      t.integer :user_id
      t.string :bill_name
      t.string :bill_address
      t.string :ship_address
      t.string :ship_name
      t.timestamps
    end
  end
end
