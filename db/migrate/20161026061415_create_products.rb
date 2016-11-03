class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :quantity
      t.boolean :onsale

      t.timestamps
    end
  end
end
