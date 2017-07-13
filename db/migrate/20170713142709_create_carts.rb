class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end
