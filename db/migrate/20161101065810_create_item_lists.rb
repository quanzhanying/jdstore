class CreateItemLists < ActiveRecord::Migration[5.0]
  def change
    create_table :item_lists do |t|
      t.integer :order_id
      t.string :item_name
      t.integer :item_price
      t.integer :quantity
      t.timestamps
    end
  end
end
