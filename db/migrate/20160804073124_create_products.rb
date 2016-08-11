class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :admin_id
      t.integer :quantity
      t.integer :price
      t.boolean :is_hidden

      t.timestamps
    end
  end
end
