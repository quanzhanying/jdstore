class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :total, :precision => 10, :scale => 2
      t.integer :user_id
      t.string  :shipping_name
      t.string  :shipping_address
      t.string  :shipping_number
      t.string  :shipping_by
      t.string  :paid_by
      t.timestamps
    end
  end
end
