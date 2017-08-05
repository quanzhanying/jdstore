class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :order_id
      t.string :product_name
      t.integer :price
      t.integer :quantity
      t.timestamps
    end
  end
end
