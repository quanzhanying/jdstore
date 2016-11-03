class CreateProductLists < ActiveRecord::Migration[5.0]
  def change
    create_table :product_lists do |t|
      t.integer :quantity
      t.float :price
      t.integer :order_id
      t.integer :product_id

      t.timestamps
    end
  end
end
