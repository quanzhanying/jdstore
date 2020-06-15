class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :quantity
      t.string :size
      t.integer :category_id
      t.string :image

      t.timestamps
    end
  end
end
