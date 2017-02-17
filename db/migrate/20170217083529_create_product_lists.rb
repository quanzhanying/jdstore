class CreateProductLists < ActiveRecord::Migration[5.0]
  def change
    create_table :product_lists do |t|
      t.integer :order_id
      t.string  :order_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
