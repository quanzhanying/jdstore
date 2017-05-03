class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :descritpion
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
