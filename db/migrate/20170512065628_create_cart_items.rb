class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.decimal :price, precision: 10, scale:2
      t.decimal :msrp, precision: 10, scale:2
      t.string :price_unit
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end
