class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :item_id
      t.integer :storage, default: 1
      t.timestamps
    end
  end
end
