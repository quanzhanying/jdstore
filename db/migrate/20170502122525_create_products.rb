class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :stock
      t.boolean :can_sell
      t.integer :user_id

      t.timestamps
    end
  end
end
